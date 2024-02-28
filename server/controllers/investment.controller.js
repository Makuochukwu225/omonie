const InvestmentModel = require('../models/investment');
const userModel = require('../models/User');
const { extractAndVerifyToken } = require('../helpers/extractAndValidateToken');

const { investmentSchema } = require('../helpers/validate_schema');

exports.createInvestment = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const { title, roi, duration, description, deposit }  = await investmentSchema.validateAsync(req.body);

        const newInvestment = new InvestmentModel({
            title,
            roi,
            duration,
            description,
            deposit,
        });

        // Save the new investment
        await newInvestment.save();

        // Fetch the user from the database
        const user = await userModel.findById(decodedToken.userId);

        if (!user) {
            return res.status(404).json({
                success: false,
                message: 'User not found',
            });
        }


        // Save changes to the user
        await user.save();

        res.status(201).json({
            success: true,
            message: 'Investment Created Successfully',
            data: newInvestment,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: 'Internal Server Error',
            error: err.message,
        });
    }
};

exports.updateInvestment = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const { investmentId } = req.params;
        const { title, roi, duration, description, deposit } = req.body;

        const investment = await InvestmentModel.findById(investmentId);

        if (!investment) {
            return res.status(404).json({
                success: false,
                message: 'Investment not found',
            });
        }

        // Update investment fields
        investment.title = title || investment.title;
        investment.roi = roi || investment.roi;
        investment.duration = duration || investment.duration;
        investment.description = description || investment.description;
        investment.deposit = deposit || investment.deposit;

        // Save changes to the investment
        await investment.save();

        res.status(200).json({
            success: true,
            message: 'Investment updated successfully',
            data: investment,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: 'Internal Server Error',
            error: err.message,
        });
    }
};

exports.fetchInvestment = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const { investmentId } = req.params;
        const investment = await InvestmentModel.findById(investmentId);

        if (!investment) {
            return res.status(404).json({
                success: false,
                message: 'Investment not found',
            });
        }

        res.status(200).json({
            success: true,
            message: 'Investment fetched successfully',
            data: investment,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: 'Internal Server Error',
            error: err.message,
        });
    }
};


exports.fetchInvestments = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const investments = await InvestmentModel.find();

        res.status(200).json({
            success: true,
            message: 'Investments fetched successfully',
            data: investments,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: 'Internal Server Error',
            error: err.message,
        });
    }
};

exports.deleteInvestment = async (req, res) => {
    try {
        const { investmentId } = req.params;
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const investment = await InvestmentModel.findById(investmentId);

        if (!investment) {
            return res.status(404).json({
                success: false,
                message: 'Investment not found',
            });
        }

        // Perform additional checks if needed

        // Delete the investment
        await InvestmentModel.findByIdAndDelete(investmentId);

        res.status(200).json({
            success: true,
            message: 'Investment deleted successfully',
            data: investment,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: 'Internal Server Error',
            error: err.message,
        });
    }
};

exports.purchaseInvestment = async (req, res) => {
    try {
        const { investmentId } = req.params;
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const investment = await InvestmentModel.findById(investmentId);

        if (!investment) {
            return res.status(404).json({
                success: false,
                message: 'Investment not found',
            });
        }

        if (investment.user !== null) {
            return res.status(400).json({
                success: false,
                message: 'Investment has already been purchased',
            });
        }

        const user = await UserModel.findById(decodedToken.userId);

        if (!user) {
            return res.status(404).json({
                success: false,
                message: 'User not found',
            });
        }

        // Perform additional checks if needed

        if (user.availableNaira < investment.deposit[0]) {
            return res.status(400).json({
                success: false,
                message: 'Insufficient funds to purchase the investment',
            });
        }

        // Deduct the investment deposit from user's availableNaira
        user.availableNaira -= investment.deposit[0];

        // Update user's investments array with the purchased investment
        user.investments.push(investmentId);

        // Save changes to the user
        await user.save();

        // Update the investment's user field with the purchaser's user ID
        investment.user = decodedToken.userId;

        // Save changes to the investment
        await investment.save();

        res.status(200).json({
            success: true,
            message: 'Investment purchased successfully',
            data: {
                user: user,
                investment: investment,
            },
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            success: false,
            message: 'Internal Server Error',
            error: err.message,
        });
    }
};

const nutModel = require('../models/nut');
const { extractAndVerifyToken } = require('../helpers/extractAndValidateToken');
const userModel = require('../models/User')

const { nutSchema } = require('../helpers/validate_schema')

exports.createNut = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        // const { error, value } = await nutSchema.validateAsync(req.body);

        // if (error) {
        //     return res.status(400).json({ error: error.details[0].message });
        // }

        const { image, nutValue, nairaValue } = await nutSchema.validateAsync(req.body);

        const nut = new nutModel({ image, nutValue, nairaValue });

        await nut.save();
        res.status(201).json({
            message: 'Nut Created Successfully',
            data: nut
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }
}

exports.updateNut = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { nutId } = req.params;
        const { error, value } = await nutSchema.validateAsync(req.body);

        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }

        const nut = await nutModel.findOne({ _id: nutId });

        if (!nut) {
            return res.status(404).json({
                message: 'Nut does not exist'
            });
        }

        const { image, nutValue, nairaValue } = value;

        nut.image = image;
        nut.nutValue = nutValue;
        nut.nairaValue = nairaValue;

        await nut.save();
        res.status(200).json({
            message: 'Nut updated successfully',
            data: nut
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }
}

exports.fetchNut = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { nutId } = req.params;
        const nut = await nutModel.findOne({ _id: nutId });

        res.status(201).json({
            message: 'Nut fetched successfully',
            data: nut
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }

}



exports.fetchNuts = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const nuts = await nutModel.find();
        res.status(201).json({
            message: 'Nuts fetched successfully',
            data: nuts
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }

}

exports.deleteNut = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { nutId } = req.params;
        const nut = await nutModel.findOne({ _id: nutId });
        if (!nut) {
            res.status(404).json({
                message: 'Nut does not exist',
                data: nut
            });
        }
        await nutModel.findOneAndDelete( {_id: nutId} );
        res.status(201).json({
            message: 'Nut deleted successfully',
            data: nut
        });
    } catch (err) {
        console.log(err.message);
        res.status(500).json({
            msg: 'Error!!',
            error: err.message
        });
    }

}

exports.purchaseNut = async (req, res) => {
    try {
        const { nutId } = req.params;
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const nut = await nutModel.findById(nutId);

        if (!nut) {
            return res.status(404).json({
                success: false,
                message: 'Nut not found',
            });
        }

        const user = await userModel.findById(decodedToken.userId);

        if (!user) {
            return res.status(404).json({
                success: false,
                message: 'User not found',
            });
        }

        if (user.availableNaira < nut.nairaValue) {
            return res.status(400).json({
                success: false,
                message: 'Insufficient funds to purchase the nut',
            });
        }

        user.availableNaira -= nut.nairaValue;
        user.availableNut += nut.nutValue; // Add the purchased nut quantity
        await user.save();
        res.status(200).json({
            success: true,
            message: 'Nut purchased successfully',
            data: {
                user: user,
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


exports.transferNut = async (req, res) => {
    try {
        const { userId } = req.params;
        const { nut } = req.body;
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }



        const sender = await userModel.findById(decodedToken.userId); // Assuming sender's ID is in req.user._id
        const receiver = await userModel.findById(userId);
        if (!receiver) {
            return res.status(404).json({
                success: false,
                message: 'Receiver not found',
            });
        }

        if (sender.availableNut < nut) {
            return res.status(400).json({
                success: false,
                message: 'Insufficient nuts to transfer',
            });
        }

        // Transfer nut from sender to receiver
        sender.availableNut -= nut;
        receiver.availableNut += nut;

        await sender.save();
        await receiver.save();

        res.status(200).json({
            success: true,
            message: 'Nut transferred successfully',
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




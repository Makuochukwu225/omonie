const assetModel = require('../models/asset');
const { extractAndVerifyToken } = require('../helpers/extractAndValidateToken');
const userModel = require('../models/User')

const { assetSchema } = require('../helpers/validate_schema')

exports.createAsset = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { image, title, description, value,type } = await assetSchema.validateAsync(req.body);

        const asset = new assetModel({ image, title, description, value,type });

        await asset.save();
        res.status(201).json({
            message: 'Asset Created Successfully',
            data: asset
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }

}


exports.updateAsset = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { assetId } = req.params;
        const { image, title, description, value } = req.body;

        const asset = await  assetModel.findOne({ _id: assetId });

        if (!asset) {
            res.status(404).json({
                message: 'Asset does not exist',
                
            });
        }
        asset.image = image || asset.image;
        asset.title = title || asset.title;
        asset.description = description || asset.description;
        asset.value = value || asset.value;

        await asset.save();
        res.status(201).json({
            message: 'Asset updated successfully',
            data: asset
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }

}

exports.fetchAsset = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { assetId } = req.params;
        const asset = await assetModel.findOne({ _id: assetId });

        res.status(201).json({
            message: 'Asset fetched successfully',
            data: asset
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }

}



exports.fetchAssets = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const avatar = await assetModel.find();
        res.status(201).json({
            message: 'Assets fetched successfully',
            data: avatar
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }

}

exports.deleteAsset = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { assetId } = req.params;
        const asset = await assetModel.findOne({ _id: assetId });
        if (!asset) {
            res.status(404).json({
                message: 'Asset does not exist',
                data: asset
            });
        }
        await assetModel.findOneAndDelete( {_id: assetId} );
        res.status(201).json({
            message: 'Asset deleted successfully',
            data: asset
        });
    } catch (err) {
        console.log(err.message);
        res.status(500).json({
            msg: 'Error!!',
            error: err.message
        });
    }

}

exports.purchaseAsset = async (req, res) => {
    try {
        const { assetId } = req.params;
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({
                success: false,
                message: 'Invalid Authorization header format',
            });
        }

        const asset = await assetModel.findById(assetId);

        if (!asset) {
            return res.status(404).json({
                success: false,
                message: 'Asset not found',
            });
        }

        if (asset.user === null) {
            return res.status(400).json({
                success: false,
                message: 'Asset has already been purchased',
            });
        }

        const user = await userModel.findById(decodedToken.userId);

        if (!user) {
            return res.status(404).json({
                success: false,
                message: 'User not found',
            });
        }

        if (user.availableNaira < asset.value) {
            return res.status(400).json({
                success: false,
                message: 'Insufficient funds to purchase the asset',
            });
        }

        // Deduct the asset value from user's availableNaira
        user.availableNaira -= asset.value;

        // Update user's assets array with the purchased asset
        user.assets.push(assetId);

        // Save changes to the user
        await user.save();

        // Update the asset's user field with the purchaser's user ID
        asset.user = decodedToken.userId;

        // Save changes to the asset
        await asset.save();

        res.status(200).json({
            success: true,
            message: 'Asset purchased successfully',
            data: {
                user: user,
                asset: asset,
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








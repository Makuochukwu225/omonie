const avatarModel = require('../models/avatar');
const jwt = require('jsonwebtoken');
const { extractAndVerifyToken } = require('../helpers/extractAndValidateToken');

const { avatarSchema } = require('../helpers/validate_schema')

exports.createAvatar = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { image, title, description, value } = await avatarSchema.validateAsync(req.body);

        const avatar = new avatarModel({ image, title, description, value });

        await avatar.save();
        res.status(201).json({
            message: 'Avatar Created Successfully',
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


exports.updateAvatar = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { avatarId } = req.params;
        const { image, title, description, value } = req.body;

        const avatar = await  avatarModel.findOne({ _id: avatarId });

        if (!avatar) {
            res.status(404).json({
                message: 'Avatar does not exist',
                
            });
        }

        avatar.image = image || avatar.image;
        avatar.title = title || avatar.title;
        avatar.description = description || avatar.description;
        avatar.value = value || avatar.value;



        await avatar.save();
        res.status(201).json({
            message: 'Avatar updated successfully',
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

exports.fetchAvatar = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { avatarId } = req.params;
        const avatar = await avatarModel.findOne({ _id: avatarId });

        res.status(201).json({
            message: 'Avatar updated successfully',
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



exports.fetchAvatars = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        const avatar = await avatarModel.find();
        res.status(201).json({
            message: 'Avatar fetched successfully',
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

exports.deleteAvatar = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const { avatarId } = req.params;
        const avatar = await avatarModel.findOne({ _id: avatarId });
        if (!avatar) {
            res.status(404).json({
                message: 'Avatar does not exist',
                data: avatar
            });
        }
        await avatarModel.findOneAndDelete( avatarId );
        res.status(201).json({
            message: 'Avatar deleted successfully',
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







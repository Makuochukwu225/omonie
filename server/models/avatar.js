const mongoose = require('mongoose');

const avatarSchema = mongoose.Schema({
    image: {
        type: String,
        default: null,
    },
    title: {
        type: String,
        default: null,
    },
    owner: {
        type: String,
        default: null,
    },
    description: {
        type: String,
        default: null,
    },
    value: {
        type: Number,
        default: 0,
    },
}, {
    timestamps: true, // Add timestamps to the schema
});


module.exports = mongoose.model('avatarModel', avatarSchema);
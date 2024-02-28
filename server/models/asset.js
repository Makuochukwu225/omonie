const mongoose = require('mongoose');

const assetSchema = mongoose.Schema({
    image: {
        type: String,
        default: null,
    },
    title: {
        type: String,
        default: null,
    },
    type:{
        type: String,
        enum: ['Sticker', 'Badge', 'Game Booster','Avatar','Frame', 'Award'],
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


module.exports = mongoose.model('assetModel', assetSchema);
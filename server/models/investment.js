const mongoose = require('mongoose');

const investmentSchema = mongoose.Schema({

    title: {
        type: String,
        default: null,
    },
    roi: {
        type: [Number],
        default: [0, 0],
    },
    duration:{
        type: String,
        default: null,
    },
    description: {
        type: String,
        default: null,
    },
    deposit: {
        type: [Number],
        default: [0, 0],
    },
}, {
    timestamps: true, // Add timestamps to the schema
});


module.exports = mongoose.model('investmentModel', investmentSchema);
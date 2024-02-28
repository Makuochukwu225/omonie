const mongoose = require('mongoose');

const nutSchema = mongoose.Schema({
    image: {
        type: String,
        default: null,
    },
    nutValue: {
        type: Number,
        default: 0,
    },
    nairaValue: {
        type: Number,
        default: 0,
    },
}, {
    timestamps: true, // Add timestamps to the schema
});


module.exports = mongoose.model('nutModel', nutSchema);
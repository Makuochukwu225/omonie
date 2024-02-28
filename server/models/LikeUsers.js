const mongoose = require('mongoose');

// Create user schema for authentication
const likeUserSchema = mongoose.Schema(
  {
    firstName: {
      type: String,
      default: null,
    },
    lastName: {
      type: String,
      default: null,
    },
    email: {
      type: String,
      default: null,
    },
    userName: {
      type: String,
      unique: true,
      default: null,
    },
    verified: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true, // Add timestamps to the schema
  }
);

module.exports = mongoose.model('userModel', likeUserSchema);

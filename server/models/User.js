const { object } = require('joi');
const mongoose = require('mongoose');

const IntentionEnum = ['Play Games', 'Invest', 'Learn'];

const userSchema = mongoose.Schema(
  {
    firstName: {
      type: String,
      default: null,
    },
    avatar: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'avatarModel',
    },
    lastName: {
      type: String,
      default: null,
    },
    email: {
      type: String,
      required: true,
      unique: true,
      match: /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
    },
    gender: {
      type: String,
      enum: ['Male', 'Female', 'Other'],
      default: null,
    },
    userName: {
      type: String,
      unique: true,
      default: null,
    },
    location: {
      type: String,
      default: null,
    },
    phoneNumber: {
      type: String,
      default: null,
    },
    dateOfBirth: {
      type: Date,
      default: null,
    },
    availableNut: {
      type: Number,
      default: 0,
    },
    availableNaira: {
      type: Number,
      default: 0,
    },
    level: {
      type: Number,
      default: 0,
    },
    intentions: {
      type: [{
        type: String,
        enum: IntentionEnum,
      }],
      default: [],
    },
    password: {
      type: String,
      required: true,
    },
    following: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'userModel', // Reference to the User model
      },
    ],
    followers: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'userModel', // Reference to the User model
      },
    ],
    post: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'postModel', // Reference to the User model
      },
    ],
    followerCount: {
      type: Number,
      default: 0,
    },
    followingCount: {
      type: Number,
      default: 0,
    },
    postCount: {
      type: Number,
      default: 0,
    },
    assets: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'assetModel',
      },
    ],
    verified: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true, // Add timestamps to the schema
  }
);



module.exports = mongoose.model('userModel', userSchema);

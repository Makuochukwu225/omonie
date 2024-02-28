const mongoose = require('mongoose');


const commentSchema = mongoose.Schema(
  {

    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User', // Assuming you have a User model
    },
    content: {
      type: String,
      required: true,
    },


  }, {
  timestamps: true,
}
);

const likeSchema = mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User', // Assuming you have a User model
    },

  },
  {
    timestamps: true,
  }
);

const postSchema = mongoose.Schema(
  {
    title: {
      type: String,
      default: null,
    },
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'userModel', // Assuming you have a User model
    },
    description: {
      type: String,
      default: null,
    },
    image: {
      type: String,
      default: null,
    },
    type: {
      type: String,
      default: null,
      enum: ['Giveaway', 'Investment', 'Poll'],
    },
    like: [likeSchema],
    comments: [commentSchema],
    tags: {
      type: [String],
      default: [],
    },
    verified: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model('postModel', postSchema);
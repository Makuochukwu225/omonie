const Joi = require('joi');

const IntentionEnum = ['Play Games', 'Invest', 'Learn'];

const userSchema = Joi.object({
  firstName: Joi.string().default(null),
  avatar: Joi.string().default(null),
  lastName: Joi.string().default(null),
  email: Joi.string().email().required(),
  gender: Joi.string().valid('Male', 'Female', 'Other').default(null),
  userName: Joi.string().default(null),
  location: Joi.string().default(null),
  phoneNumber: Joi.string().default(null),
  dateOfBirth: Joi.date().default(null),
  intentions: Joi.array().items(Joi.string().valid(...IntentionEnum)),
  availableNut: Joi.number().default(0),
  availableNaira: Joi.number().default(0),
  level: Joi.number().default(0),
  password: Joi.string().required(),
  verified: Joi.boolean().default(false),
})

const avatarSchema = Joi.object({
  image: Joi.string().required(),
  title: Joi.string().required(),
  description: Joi.string().required(),
  value: Joi.required() // Change it to 8 chars later
})

const assetSchema = Joi.object({
  image: Joi.string().required(),
  title: Joi.string().required(),
  type: Joi.string().valid('Sticker', 'Badge', 'Game Booster', 'Avatar', 'Frame', 'Award').allow(null).required(),
  description: Joi.string().required(),
  value: Joi.number().required().min(2) // Change it to 8 chars later
})
const nutSchema = Joi.object({
  image: Joi.string().required(),
  nutValue: Joi.number().required().min(2), // Change it to 8 chars later
  nairaValue: Joi.number().required().min(2) // Change it to 8 chars later
});

const commentSchema = Joi.object({
  commentId: Joi.string().default(null),
  userId: Joi.string().required(),
  content: Joi.string().required(),
  timestamp: Joi.date().default(null),
});

const likeSchema = Joi.object({
  likeId: Joi.string().default(null),
  userId: Joi.string().required(),
  timestamp: Joi.date().default(null),
});

const postSchema = Joi.object({
  title: Joi.string().default(null),
  description: Joi.string().default(null),
  image: Joi.string().default(null),
  type: Joi.string().valid('Giveaway', 'Investment', 'Poll').default(null),
  like: Joi.array().items(likeSchema),
  comments: Joi.array().items(commentSchema),
  tags: Joi.array().items(Joi.string()).default([]),
  verified: Joi.boolean().default(false),
  timestamps: Joi.date().default(null),
});

const investmentSchema = Joi.object({
  title: Joi.string().required(),
  roi: Joi.array().items(Joi.number()).length(2).required(),
  duration: Joi.string().required(),
  description: Joi.string().required(),
  deposit: Joi.array().items(Joi.number()).length(2).required(),
});

module.exports = {
  userSchema, avatarSchema, assetSchema, postSchema,investmentSchema,nutSchema
}
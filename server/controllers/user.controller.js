const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const Joi = require('joi')
const { uniqueNamesGenerator, adjectives, colors, animals, starWars } = require('unique-names-generator');
const { extractAndVerifyToken } = require('../helpers/extractAndValidateToken');

const userModel = require('../models/User')
const tokenModel = require('../models/Token')
const avatarModel = require('../models/avatar');

const { userSchema } = require('../helpers/validate_schema')
const { sendVerifyMail, sendResetMail, sendChangeMail } = require('../helpers/sendMail')



exports.sendOtp = async (req, res) => {
    try {
        const { email } = req.body;

        // Generate a random 6-digit OTP
        const otp = Math.floor(100000 + Math.random() * 900000);

        // Save OTP to the database
        const token = new tokenModel({
            userId: email,
            token: otp,
        });
        await token.save();

        // Send verification email with OTP
        const message = `Your verification code is ${otp}`;
        await sendVerifyMail(email, message);

        // Respond to the client
        res.status(201).json({
            message: 'An email has been sent to your account. Please verify!',
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!!',
            error: err.message, // Use err.message for better error reporting
        });
    }
}
exports.verifyOtp = async (req, res) => {
    try {
        const { token, email, } = req.body;
        const userToken = await tokenModel.findOne({ userId: email, token: token })
        if (!userToken) {
            return res.status(400).json({
                message: 'Invalid token'
            })
        }
        await tokenModel.findOneAndDelete(userToken._id);
        res.status(200).json({
            message: 'Email is verified'
        })
    }
    catch (err) {
        console.log(err);
        res.status(500).json({
            message: 'Error!',
            error: err
        })
    }
}
exports.registerUser = async (req, res) => {
    try {
        const { firstName, lastName, gender, location, dateOfBirth, phoneNumber, avatar, intentions } = req.body;
        const { email, password } = await userSchema.validateAsync(req.body);


        const userName = uniqueNamesGenerator({
            dictionaries: [colors, animals, starWars], // colors can be omitted here as not used
            length: 2,
            separator: "",
            style: 'capital'
        });

        var id = avatar;

        const user = await userModel.findOne({ email });

        if (user) {
            return res.status(409).json({
                message: 'Email address already in use!'
            });
        }

        bcrypt.hash(password, 10, async (err, hash) => {
            if (err) {
                return res.status(500).json({
                    msg: 'User registration failed!',
                    error: err
                });
            }

            const user = new userModel({
                email, password: hash
            });

            user.firstName = firstName || user.firstName;
            user.lastName = lastName || user.lastName;
            user.gender = gender || user.gender;
            user.location = location || user.location;
            user.dateOfBirth = dateOfBirth || user.dateOfBirth;
            user.userName = userName || user.userName;
            user.phoneNumber = phoneNumber || user.phoneNumber;
            user.verified = true || user.verified;
            user.avatar = id || user.avatar;
            user.intentions = intentions || user.intentions;

            await user.save();

            res.status(201).json({
                message: 'Account created successfully',
            });
        })
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }
}
exports.updateAccount = async (req, res) => {
    try {
        const { firstName, lastName, gender, location, dateOfBirth, email, phoneNumber, intentions } = req.body;



        const user = await userModel.findOne({ email: { $eq: email } });

        if (!user) {
            return res.status(403).json({
                message: 'Email address is not registered!'
            });
        }

        if (!user.verified) {
            return res.status(403).json({
                message: 'Kindly verify email address before login!'
            })
        }

        user.firstName = firstName || user.firstName;
        user.lastName = lastName || user.lastName;
        user.gender = gender || user.gender;
        user.location = location || user.location;
        user.dateOfBirth = dateOfBirth || user.dateOfBirth;
        user.userName = userName || user.userName;
        user.phoneNumber = phoneNumber || user.phoneNumber;
        user.intentions = intentions || user.intentions;

        await user.save();

        res.status(201).json({
            message: 'User Details updated',
        });
    } catch (err) {
        res.status(500).json({
            msg: 'Error!!',
            error: err
        });
    }


}
exports.loginUser = async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await userModel.findOne({ email });

        if (!user) {
            return res.status(403).json({
                message: 'Email address is not registered!'
            });
        }

        const passwordMatch = await bcrypt.compare(password, user.password);

        if (!passwordMatch) {
            return res.status(403).json({
                message: 'Invalid username/password!'
            });
        }

        if (!user.verified) {
            return res.status(403).json({
                message: 'Kindly verify email address before login!'
            });
        }

        // Generate an access token
        const accessToken = jwt.sign(
            {
                email,
                userId: user._id
            },
            process.env.JWT_KEY,
            {
                expiresIn: '7d'
            }
        );

        // Generate a refresh token
        const refreshToken = jwt.sign(
            {
                email,
                userId: user._id
            },
            process.env.JWT_REFRESH_KEY,
            {
                expiresIn: '7d' // Refresh token is valid for 7 days
            }
        );

        return res.status(200).json({
            userId: user._id,
            email: email,
            firstName: user.firstName,
            message: 'Login successful!!',
            accessToken: accessToken,
            refreshToken: refreshToken,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error during login!',
            error: err.message
        });
    }
};
exports.sendPasswordResetOtp = async (req, res) => {
    try {
        const schema = Joi.object({ email: Joi.string().email().required() })
        const { err } = schema.validate(req.body)
        const { email } = req.body

        if (err) {
            return res.status(400).json({
                message: 'Error!',
                error: err
            })
        }

        const user = await userModel.findOne({ email: email })

        if (!user) {
            return res.status(404).json({
                message: 'Email address is not registered!!'
            })
        }

        const token = new tokenModel({
            userId: user._id,
            token: Math.floor(100000 + Math.random() * 900000)
        })

        await token.save();

        const message = `${token.token}`

        sendResetMail(email, message)

        res.status(201).json({
            message: 'Password reset link has been sent to your email address!'
        })
    } catch (err) {
        res.status(500).json({
            message: 'Error!!',
            error: err
        })
    }
}
exports.verifyPasswordResetOtp = async (req, res) => {
    try {
        const { token, email, } = req.body;
        const user = await userModel.findOne({ email: { $eq: email } })

        if (!user) {
            return res.status(400).json({
                message: 'no user found'
            });
        }
        const userToken = await tokenModel.findOne({ userId: user._id, token: token });

        console.log(userToken);

        if (!userToken) {
            return res.status(400).json({
                message: 'token invalid!'
            })
        }
        await tokenModel.findOneAndDelete(userToken._id);
        res.status(200).json({
            message: 'Email is verified',
            data: user
        })
    }
    catch (err) {
        console.log(err);
        res.status(500).json({
            message: 'Error!',
            error: err
        })
    }
}
exports.resetPassword = async (req, res) => {
    try {
        const { password, email } = req.body
        const user = await userModel.findOne({ email: { $eq: email } })

        if (!user) {
            return res.status(400).json({
                message: 'no user found'
            });
        }

        bcrypt.hash(password, 10, async (err, hash) => {
            if (err) {
                return res.status(500).json({
                    message: 'Password reset failed!',
                    error: err
                })
            }
            user.password = hash
            await user.save();

        })

        res.status(200).json({
            message: 'Password reset successful. Login with your new account password!'
        });
    }
    catch (err) {
        console.log(err);
        res.status(500).json({
            message: 'Error!!',
            error: err
        })
    }
}
exports.checkPhone = async (req, res) => {
    try {
        const { phoneNumber } = req.body;
        const users = await userModel.find({ phoneNumber }).select('-_id');
        for (const user of users) {
            const a = await avatarModel.findOne({ _id: user.avatar }).select("-__v").select('-owner').select('-createdAt').select('-updatedAt');
            user.avatar = a;
        }


        res.json({
            data:
                users
            ,
            message: users.length > 0 ? 'Users found' : 'No users found'
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err
        });
    }
};
exports.checkUserName = async (req, res) => {
    try {
        const { userName } = req.body;
        // const users = await userModel.find({ userName }).select('-_id');
        const users = await userModel
        .find({ userName })
        .select('-password')
        .populate({
            path: 'avatar',
            select: '-__v -owner -createdAt -updatedAt',
        })
        .populate({
            path: 'followers',
            select: 'firstName lastName email avatar', // Exclude circular references
            populate: {
                path: 'avatar',
                select: '-__v -owner -createdAt -updatedAt',
            },
        })
        .populate({
            path: 'following',
            select: 'firstName lastName email avatar', // Exclude circular references
            populate: {
                path: 'avatar',
                select: 'image title',
            },
        }).populate({
            path: 'assets',
            select: 'image title description value',
        }).populate({
            path: 'post',
            select: 'image title description',
        });
        // for (const user of users) {
        //     const a = await avatarModel.findOne({ _id: user.avatar }).select("-__v").select('-owner').select('-createdAt').select('-updatedAt');
        //     user.avatar = a;
        // }


        res.json({
            data:
                users
            ,
            message: users.length > 0 ? 'Users found' : 'No users found'
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err
        });
    }
};
exports.myProfile = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        if (!authorizationHeader) {
            // Handle the case where there is no Authorization header
            return res.status(401).json({ error: 'Unauthorized - Bearer token is missing' });
        }
        const [bearer, token] = authorizationHeader.split(' ');

        if (bearer !== 'Bearer' || !token) {
            // Handle the case where the Authorization header is not in the expected format
            return res.status(401).json({ error: 'Unauthorized - Invalid Authorization header format' });
        }
        const decodedToken = jwt.verify(token, process.env.JWT_KEY);
        const { userId } = decodedToken;

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const user = await userModel
            .findOne({ _id: userId })
            .select('-password')
            .populate({
                path: 'avatar',
                select: '-__v -owner -createdAt -updatedAt',
            })
            .populate({
                path: 'followers',
                select: 'firstName lastName email avatar', // Exclude circular references
                populate: {
                    path: 'avatar',
                    select: '-__v -owner -createdAt -updatedAt',
                },
            })
            .populate({
                path: 'following',
                select: 'firstName lastName email avatar', // Exclude circular references
                populate: {
                    path: 'avatar',
                    select: 'image title',
                },
            }).populate({
                path: 'assets',
                select: 'image title description value',
            }).populate({
                path: 'post',
                select: 'image title description',
            });
        if (!user) {
            return res.status(404).json({
                message: 'User not found',
                data: user
            })
        }
        const userWithCounts = {
            ...user.toObject(),
            followerCount: user.followers.length,
            followingCount: user.following.length,
            postCount: user.post.length,
        };
        res.status(201).json({
            message: 'Users found',
            data: userWithCounts
        })
    } catch (err) {
        console.log(err);
        res.status(500).json({
            message: 'Error!!',
            error: err
        })
    }

}
exports.viewAllUsers = async (req, res) => {

    try {
        const authorizationHeader = req.headers['authorization'];

        if (!authorizationHeader) {

            return res.status(401).json({ error: 'Unauthorized - Bearer token is missing' });
        }
        const [bearer, token] = authorizationHeader.split(' ');

        if (bearer !== 'Bearer' || !token) {
            return res.status(401).json({ error: 'Unauthorized - Invalid Authorization header format' });
        }
        const decodedToken = jwt.verify(token, process.env.JWT_KEY);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }
        const user = await userModel.find().select('-password');

        res.status(201).json({
            message: 'Users found',
            data: user
        })
    } catch (err) {
        console.log(err);
        res.status(500).json({
            message: 'Error!!',
            error: err
        })
    }

}
exports.checkEmail = async (req, res) => {

    try {
        const { email } = req.body;
        const user = await userModel.findOne({ email }).select('_id');

        if (user) {
            return res.json({
                exists: true
            });
        }

        res.json({
            exists: false
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err
        });
    }

}
exports.viewUser = async (req, res) => {
    try {
        const { userId } = req.params;
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const user = await userModel
            .findOne({ _id: userId })
            .select('-password')
            .populate({
                path: 'avatar',
                select: '-__v -owner -createdAt -updatedAt',
            })
            .populate({
                path: 'followers',
                select: 'firstName lastName email avatar', // Exclude circular references
                populate: {
                    path: 'avatar',
                    select: '-__v -owner -createdAt -updatedAt',
                },
            })
            .populate({
                path: 'following',
                select: 'firstName lastName email avatar', // Exclude circular references
                populate: {
                    path: 'avatar',
                    select: 'image title',
                },
            }).populate({
                path: 'assets',
                select: 'image title description value',
            }).populate({
                path: 'post',
                select: 'image title description',
            });

        if (!user) {
            return res.status(404).json({
                message: 'User not found',
                data: null
            });
        }

        // Calculate and add followerCount and followingCount
        const userWithCounts = {
            ...user.toObject(),
            followerCount: user.followers.length,
            followingCount: user.following.length,
            postCount: user.post.length,
        };

        res.status(200).json({
            message: 'User found',
            data: userWithCounts,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Internal Server Error',
            error: err.message
        });
    }
};





exports.toggleFollowUser = async (req, res) => {
    try {
        const userId = req.params.userId;
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);
        if (decodedToken.userId === userId) {
            return res.status(400).json({
                message: 'Cannot follow or unfollow yourself',
            });
        }

        const currentUser = await userModel.findById(decodedToken.userId);
        const targetUser = await userModel.findById(userId);

        if (!targetUser) {
            return res.status(404).json({
                message: 'Target user not found',
            });
        }

        const isFollowing = currentUser.following.includes(userId);

        if (isFollowing) {
            // Unfollow the user
            currentUser.following.pull(userId);
            await currentUser.save();

            targetUser.followers.pull(decodedToken.userId);
            await targetUser.save();

            res.status(200).json({
                message: 'User unfollowed successfully',
                isFollowing: false,
            });
        } else {
            // Follow the user
            currentUser.following.push(userId);
            await currentUser.save();

            if (!targetUser.followers) {
                targetUser.followers = [];
            }
            targetUser.followers.push(decodedToken.userId);
            await targetUser.save();

            res.status(200).json({
                message: 'User followed successfully',
                isFollowing: true,
            });
        }
    } catch (err) {
        console.error(err.stack);
        res.status(500).json({
            message: 'Error!',
            error: err.message,
        });
    }
};













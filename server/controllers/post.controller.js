const postModel = require('../models/Post');
const userModel = require('../models/User');

const commentModel = require('../models/comment');

const { extractAndVerifyToken } = require('../helpers/extractAndValidateToken');

const { postSchema } = require('../helpers/validate_schema')

exports.createPost = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { userId } = decodedToken;
        const { image, title, description, type, tags } = await postSchema.validateAsync(req.body);

        const newPost = new postModel({
            user: userId,  // Include the user ID
            image,
            title,
            description,
            type,
            tags,
            verified: false,
        });
        await newPost.save();

        const currentUser = await userModel.findById(userId);

        
        currentUser.post.push(newPost._id);
        await currentUser.save();

        res.status(201).json({
            message: 'Post Created Successfully',
            data: newPost,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err.message,
        });
    }
};



exports.updatePost = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];

        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { postId } = req.params;
        const { title, description, image, type, tags } = req.body;

        const post = await postModel.findOne({ _id: postId });

        if (!post) {
            return res.status(404).json({
                message: 'Post does not exist',
            });
        }

        post.title = title || post.title;
        post.description = description || post.description;
        post.image = image || post.image;
        post.type = type || post.type;
        post.tags = tags || post.tags;

        await post.save();

        res.status(200).json({
            message: 'Post updated successfully',
            data: post,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err.message,
        });
    }
};

exports.fetchPost = async (req, res) => {
    try {
        const { postId } = req.params;
        const post = await postModel.findById(postId);

        if (!post) {
            return res.status(404).json({
                message: 'Post not found',
            });
        }

        res.status(200).json({
            message: 'Post retrieved successfully',
            data: post,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err.message,
        });
    }
};



exports.fetchAllPosts = async (req, res) => {
    try {
        let page = parseInt(req.query.page) || 1;
        let limit = parseInt(req.query.limit) || 10;
        page = Math.max(1, page);
        limit = Math.max(1, limit);
      

        const skip = (page - 1) * limit;

        // Extract the JWT token from the Authorization header
        const authorizationHeader = req.headers['authorization'];
        if (!authorizationHeader) {
            // User is not logged in, proceed without user details
            const posts = await postModel
                .find()
                .populate('user')
                .sort({ createdAt: -1 }) 
                .skip(skip)
                .limit(limit);

            const totalPosts = await postModel.countDocuments();

            const totalPages = Math.ceil(totalPosts / limit);
            const hasMorePages = page < totalPages;

            res.status(200).json({
                message: 'Paginated posts retrieved successfully',
                data: posts,
                page: page,
                limit: limit,
                totalPosts: totalPosts,
                totalPages: totalPages,
                hasMorePages: hasMorePages,
            });
            return;
        }


        const decodedToken = extractAndVerifyToken(authorizationHeader);
        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        // Define the fields to select for user details
        const userFields = 'firstName lastName avatar isFollowing';

        // Use populate to replace the user ObjectId with specific user details
        const posts = await postModel
            .find()
            .populate({
                path: 'user',
                select: userFields,
                populate: {
                    path: 'avatar',
                    select: '-__v -owner -createdAt -updatedAt', // Exclude fields as needed
                }
            })
            .sort({ createdAt: -1 }) 
            .skip(skip)
            .limit(limit);

        const totalPosts = await postModel.countDocuments();

        const totalPages = Math.ceil(totalPosts / limit);
        const hasMorePages = page < totalPages;

        // Determine following status for each post's user
        const userId = decodedToken.userId;
        posts.forEach(post => {
            post.user.isFollowing = Array.isArray(post.user.followers) && post.user.followers.includes(userId);
            // console.log(post.user.isFollowing);
            // const isFollowing = post.user.followers.includes(userId);
            // Add the isFollowing property to the user object of each post
            post.user.isFollowing = post.user.isFollowing;
        });

        res.status(200).json({
            message: 'Paginated posts retrieved successfully',
            data: posts,
            page: page,
            limit: limit,
            totalPosts: totalPosts,
            totalPages: totalPages,
            hasMorePages: hasMorePages,
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err.message,
        });
    }
};

exports.deletePost = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { postId } = req.params;

        const post = await postModel.findById(postId);

        if (!post) {
            return res.status(404).json({
                message: 'Post not found',
            });
        }

        await postModel.findOneAndDelete(postId);

        res.status(200).json({
            message: 'Post deleted successfully',
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err.message,
        });
    }
};
// Assuming your model is defined in 'Post.js'

exports.createComment = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { userId } = decodedToken;
        const { content } = req.body;
        const { postId } = req.params;

        const post = await postModel.findById(postId);

        if (!post) {
            return res.status(404).json({
                message: 'Post not found',
            });
        }

        const comment = {
            userId,
            content,
            timestamp: Date.now(),
        };

        post.comments.push(comment);

        await post.save();

        res.status(201).json({
            message: 'Comment Created Successfully',
            data: comment,
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err,
        });
    }
};

// Assuming you have already required your dependencies and defined your schemas

exports.updateComment = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { postId, commentId } = req.params;
        const { content } = req.body;

        // Find the post
        const post = await postModel.findById(postId);

        if (!post) {
            return res.status(404).json({
                message: 'Post not found',
            });
        }

        // Find the index of the comment in the post's comments array
        const commentIndex = await post.comments.findIndex(comment => comment._id.toString() === commentId);

        if (commentIndex === -1) {
            return res.status(404).json({
                message: 'Comment not found',
            });
        }

        // Ensure that the user making the request is the author of the comment
        if (post.comments[commentIndex].userId.toString() !== decodedToken.userId) {
            return res.status(403).json({
                message: 'You are not authorized to update this comment',
            });
        }

        // Update the content of the comment
        post.comments[commentIndex].content = content;

        // Save the updated post
        await post.save();

        res.status(200).json({
            message: 'Comment updated successfully',
            data: post.comments[commentIndex],
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err,
        });
    }
};



// Assuming you have already required your dependencies and defined your schemas

exports.deleteComment = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { postId, commentId } = req.params;

        // Find the post
        const post = await postModel.findById(postId);

        if (!post) {
            return res.status(404).json({
                message: 'Post not found',
            });
        }

        // Find the index of the comment in the post's comments array
        const commentIndex = await post.comments.findIndex(comment => comment._id.toString() === commentId);

        if (commentIndex === -1) {
            return res.status(404).json({
                message: 'Comment not found',
            });
        }

        // Ensure that the user making the request is the author of the comment
        if (post.comments[commentIndex].userId.toString() !== decodedToken.userId) {
            return res.status(403).json({
                message: 'You are not authorized to delete this comment',
            });
        }

        // Remove the comment from the post's comments array
        post.comments.splice(commentIndex, 1);

        // Save the updated post
        await post.save();

        res.status(200).json({
            message: 'Comment deleted successfully',
        });
    } catch (err) {
        console.log(err);
        res.status(500).json({
            msg: 'Error!!',
            error: err,
        });
    }
};




exports.toggleLikePost = async (req, res) => {
    try {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);

        if (!decodedToken) {
            return res.status(401).json({ error: 'Invalid Authorization header format' });
        }

        const { postId } = req.params;
        const userId = decodedToken.userId;

        const post = await postModel.findById(postId);

        if (!post) {
            return res.status(404).json({ message: 'Post not found' });
        }

        const existingLikeIndex = await post.like.findIndex(like => like.userId.equals(userId));

        if (existingLikeIndex === -1) {
            post.like.push({ userId, timestamp: Date.now() });
        } else {
            post.like.splice(existingLikeIndex, 1);
        }
        await post.save();

        res.status(200).json({
            message: existingLikeIndex === -1 ? 'Post liked successfully' : 'Post unliked successfully',
            data: { postId, userId },
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            message: 'Error!',
            error: err.message,
        });
    }
};







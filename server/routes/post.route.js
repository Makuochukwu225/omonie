const router = require('express').Router()
const postController = require('../controllers/post.controller');

// Create a new post
router.post('/posts', postController.createPost);

// Update a post by ID
router.patch('/posts/:postId', postController.updatePost);

// Get a post by ID
router.get('/posts/:postId', postController.fetchPost);

// Get all posts with pagination
router.get('/posts', postController.fetchAllPosts);

// Delete a post by ID
router.delete('/posts/:postId', postController.deletePost);

// Toggle like on a post
router.post('/posts/:postId/like', postController.toggleLikePost);


router.post('/posts/:postId/comments', postController.createComment);

// Update a comment on a post
router.patch('/posts/:postId/comments/:commentId', postController.updateComment);

// Delete a comment on a post
router.delete('/posts/:postId/comments/:commentId', postController.deleteComment);


module.exports = router;

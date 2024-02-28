const router = require('express').Router();

const userController = require('../controllers/user.controller');

router.post('/send-otp', userController.sendOtp);

router.patch('/verify-otp', userController.verifyOtp);

router.post('/register', userController.registerUser);

router.post('/login', userController.loginUser);

router.post('/password-reset', userController.sendPasswordResetOtp);

router.patch('/password-verify-otp', userController.verifyPasswordResetOtp);

router.patch('/password-reset', userController.resetPassword);

router.post('/check-phone', userController.checkPhone);

router.post('/check-userName', userController.checkUserName);

router.patch('/update-account', userController.updateAccount);

router.get('/my-user', userController.myProfile);

router.get('/user/:userId', userController.viewUser);

router.get('/users', userController.viewAllUsers);

router.post('/check-email', userController.checkEmail);

router.put('/users/:userId/follow', userController.toggleFollowUser);

module.exports = router




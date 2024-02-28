const router = require('express').Router()

const avatarController = require('../controllers/avatar.controller')




router.post('/create-avatar/', avatarController.createAvatar);

router.patch('/update-avatar/:avatarId', avatarController.updateAvatar);

router.get('/fetch-avatar/:avatarId', avatarController.fetchAvatar);

router.delete('/delete-avatar/:avatarId', avatarController.deleteAvatar);

router.get('/fetch-avatars', avatarController.fetchAvatars);

module.exports = router
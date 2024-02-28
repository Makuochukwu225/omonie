const router = require('express').Router()

const assetController = require('../controllers/asset.controller')




router.post('/create-asset/', assetController.createAsset);

router.patch('/update-asset/:assetId', assetController.updateAsset);

router.get('/fetch-avatar/:assetId', assetController.fetchAsset);

router.delete('/delete-asset/:assetId', assetController.deleteAsset);

router.get('/fetch-assets', assetController.fetchAssets);

router.put('/purchase-asset/:assetId', assetController.purchaseAsset);

module.exports = router
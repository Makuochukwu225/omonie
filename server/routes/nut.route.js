const router = require('express').Router();
const nutController = require('../controllers/nut.controller');

router.post('/create-nut', nutController.createNut);
router.patch('/update-nut/:nutId', nutController.updateNut);
router.get('/fetch-nut/:nutId', nutController.fetchNut);
router.delete('/delete-nut/:nutId', nutController.deleteNut);
router.get('/fetch-nuts', nutController.fetchNuts);
router.put('/purchase-nut/:nutId', nutController.purchaseNut);
router.put('/transfer-nut/:userId', nutController.transferNut);

module.exports = router;

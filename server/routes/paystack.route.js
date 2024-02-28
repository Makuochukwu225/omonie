

const router = require('express').Router()
const paystackController = require('../controllers/paystack.controller');

router.post('/verify/:reference', paystackController.verifyTransaction);

module.exports = router;

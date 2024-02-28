const router = require('express').Router();
const investmentController = require('../controllers/investment.controller');

router.post('/create-investment', investmentController.createInvestment);
router.patch('/update-investment/:investmentId', investmentController.updateInvestment);
router.get('/fetch-investment/:investmentId', investmentController.fetchInvestment);
router.delete('/delete-investment/:investmentId', investmentController.deleteInvestment);
router.get('/fetch-investments', investmentController.fetchInvestments);
router.put('/purchase-investment/:investmentId', investmentController.purchaseInvestment);

module.exports = router;

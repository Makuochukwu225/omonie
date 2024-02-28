const paystack = require('paystack')(process.env.PAYSTACK_SECRET_KEY);
const { extractAndVerifyToken } = require('../helpers/extractAndValidateToken');
const userModel = require('../models/User'); // Import the userModel

exports.verifyTransaction = async (req, res) => {
  try {
    const reference = req.params.reference;

    paystack.transaction.verify(reference, async (error, body) => {
      if (error) {
        console.log(error);
        res.status(500).json({ error: error.message });
        return;
      }

      if (body.data.status === "success") {
        const authorizationHeader = req.headers['authorization'];
        const decodedToken = extractAndVerifyToken(authorizationHeader);
        const { price } = req.body;

        if (price * 100 === body.data.amount) {
          // Update user's availableNut in the database
          try {
            const user = await userModel.findById(decodedToken.userId);
            if (!user) {
              res.status(404).json({ message: 'User not found' });
              return;
            }

            // Increase availableNaira by the charged amount
            user.availableNaira += price;
            await user.save();

            console.log("User's availableNut updated successfully");
          } catch (updateError) {
            console.error(updateError.message);
            res.status(500).json({
              message: 'Error updating user',
              error: updateError.message,
            });
            return;
          }
        }
      }

      res.status(200).json({ gateway_response: body.data.gateway_response });
    });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({
      message: 'Error!',
      error: err.message,
    });
  }
};

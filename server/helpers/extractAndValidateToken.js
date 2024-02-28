const jwt = require('jsonwebtoken');

function extractAndVerifyToken(authorizationHeader) {
    if (!authorizationHeader) {
        return null;
    }

    const [bearer, token] = authorizationHeader.split(' ');

    if (bearer !== 'Bearer' || !token) {
        return null;
    }

    try {
        const decodedToken = jwt.verify(token, process.env.JWT_KEY);
        return decodedToken;
    } catch (error) {
        return null;
    }
}

module.exports = { extractAndVerifyToken };

const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');

dotenv.config();

// environment-variables
const ACCESS_TOKEN = process.env.ACCESS_TOKEN;

const getVerify = (req, res, next) => {
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    try {
      token = req.headers.authorization.split(' ')[1];
      const decoded = jwt.verify(token, ACCESS_TOKEN);
      req.userId = decoded.id;
      next();
    } catch (error) {
      res.status(403).json('ACCESS DENIED');
    }
  } else {
    res.status(404).json('TOKEN NOT FOUND');
  }
};

module.exports = { getVerify };

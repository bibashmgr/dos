const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');

dotenv.config();

// models
const user = require('../models/user.js');

// environment-variables
const ACCESS_TOKEN = process.env.ACCESS_TOKEN;

const getVerify = async (req, res, next) => {
  let token;
  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    try {
      token = req.headers.authorization.split(' ')[1];
      const decoded = jwt.verify(token, ACCESS_TOKEN);

      const isUserExist = await user.findById(decoded.id);
      if (isUserExist) {
        req.userId = decoded.id;
        next();
      } else {
        res.status(403).json({
          data: null,
          message: 'Access Denied',
        });
      }
    } catch (error) {
      res.status(403).json({
        data: null,
        message: 'Access Denied',
      });
    }
  } else {
    res.status(403).json({
      data: null,
      message: 'Access Denied',
    });
  }
};

module.exports = { getVerify };

const bcrypt = require('bcryptjs');

// models
const user = require('../models/user.js');

const registerUser = async (req, res) => {
  try {
    const isExist = await user.findOne({ email: req.body.email });
    if (!isExist) {
      const salt = await bcrypt.genSalt(10);
      const hashPassword = await bcrypt.hash(req.body.password, salt);

      const newUser = new user({
        name: req.body.name,
        email: req.body.email,
        password: hashPassword,
      });
      const savedUser = await newUser.save();
      res.status(201).json({
        data: null,
        message: 'Register new User',
      });
    } else {
      res.status(409).json({
        data: null,
        message: 'Email already taken',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

module.exports = { registerUser };

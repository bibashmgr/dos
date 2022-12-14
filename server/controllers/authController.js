const bcrypt = require('bcryptjs');
const dotenv = require('dotenv');
const jwt = require('jsonwebtoken');

dotenv.config();

// models
const user = require('../models/user.js');

// environment-variables
const ACCESS_TOKEN = process.env.ACCESS_TOKEN;

const registerUser = async (req, res) => {
  try {
    const isUserExist = await user.findOne({ email: req.body.email });
    if (!isUserExist) {
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
      console.log('Register new User');
    } else {
      res.status(409).json({
        data: null,
        message: 'Email already taken',
      });
      console.log('Email already taken');
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
    console.log(error.message);
  }
};

const loginUser = async (req, res) => {
  try {
    const isUserExist = await user.findOne({ email: req.body.email });
    if (isUserExist) {
      const isPasswordMatch = await bcrypt.compare(
        req.body.password,
        isUserExist.password
      );
      if (isPasswordMatch) {
        const accessToken = jwt.sign({ id: isUserExist._id }, ACCESS_TOKEN);
        res
          .status(200)
          .json({ data: accessToken, message: 'Login Successful' });
        console.log('Login Successful');
      } else {
        res.status(403).json({
          data: null,
          message: 'Invalid Password',
        });
        console.log('Invalid Password');
      }
    } else {
      res.status(403).json({
        data: null,
        message: 'Invalid Email',
      });
      console.log('Invalid Email');
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
    console.log(error.message);
  }
};

module.exports = { registerUser, loginUser };

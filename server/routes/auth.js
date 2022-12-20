const express = require('express');

// controllers
const { registerUser } = require('../controllers/authController.js');

const router = express.Router();

router.post('/register', registerUser);

module.exports = router;

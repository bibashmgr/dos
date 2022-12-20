const express = require('express');

// controllers
const { getUsers } = require('../controllers/userController.js');

const router = express.Router();

router.get('/', getUsers);

module.exports = router;

const express = require('express');

// controllers
const { getUser, updateUser } = require('../controllers/userController.js');

// middlewares
const { getVerify } = require('../middlewares/verify.js');

const router = express.Router();

router.get('/profile', getVerify, getUser);
router.put('/edit', getVerify, updateUser);

module.exports = router;

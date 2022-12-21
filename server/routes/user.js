const express = require('express');

// controllers
const {
  getUsers,
  getUser,
  updateUser,
} = require('../controllers/userController.js');

// middlewares
const { getVerify } = require('../middlewares/verify.js');

const router = express.Router();

router.get('/', getUsers);
router.get('/:id', getUser);
router.put('/edit', getVerify, updateUser);

module.exports = router;

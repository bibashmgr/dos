const express = require('express');

// controllers
const { createTask, getTasks } = require('../controllers/taskController.js');

const router = express.Router();

router.get('/', getTasks);
router.post('/create', createTask);

module.exports = router;

const express = require('express');

// controllers
const {
  createTask,
  getTasks,
  getProjectTask,
  getTodayTask,
  getTask,
  updateTask,
  deleteTask,
} = require('../controllers/taskController.js');

// middlewares
const { getVerify } = require('../middlewares/verify.js');

const router = express.Router();

router.get('/', getVerify, getTasks);
router.get('/project/:id', getVerify, getProjectTask);
router.get('/today', getVerify, getTodayTask);
router.get('/:id', getVerify, getTask);
router.post('/create', getVerify, createTask);
router.put('/edit/:id', getVerify, updateTask);
router.delete('/delete/:id', getVerify, deleteTask);

module.exports = router;

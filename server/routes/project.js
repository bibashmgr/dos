const express = require('express');

// controllers
const {
  createProject,
  getProjects,
  getProject,
  updateProject,
  deleteProject,
} = require('../controllers/projectController.js');

// middlewares
const { getVerify } = require('../middlewares/verify.js');

const router = express.Router();

router.post('/create', getVerify, createProject);
router.get('/', getVerify, getProjects);
router.get('/:id', getVerify, getProject);
router.put('/update/:id', getVerify, updateProject);
router.delete('/delete/:id', getVerify, deleteProject);

module.exports = router;

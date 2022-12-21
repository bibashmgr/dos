// models
const project = require('../models/project.js');

// create a new project
const createProject = async (req, res) => {
  try {
    const newProject = new project({
      userId: req.userId,
      name: req.body.name,
      icon: req.body.icon,
      desc: req.body.desc,
    });
    const savedProject = await newProject.save();

    res.status(201).json({
      data: savedProject,
      message: 'Create New Project',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

// get all the projects of an user
const getProjects = async (req, res) => {
  try {
    const projects = await project.find({
      userId: req.userId,
    });

    res.status(200).json({
      data: projects,
      message: 'Fetch All Projects',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

const getProject = async (req, res) => {
  try {
    const isExist = await project.findById(req.params.id);

    if (isExist) {
      res.status(200).json({
        data: isExist,
        message: 'Fetch ProjectInfo',
      });
    } else {
      res.status(404).json({
        data: null,
        message: 'Project Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

const updateProject = async (req, res) => {
  try {
    const isExist = await project.findById(req.params.id);

    if (isExist) {
      const updatedProjectInfo = await project.findByIdAndUpdate(
        isExist._id,
        req.body,
        { new: true }
      );
      res.status(200).json({
        data: updatedProjectInfo,
        message: 'Update ProjectInfo',
      });
    } else {
      res.status(404).json({
        data: null,
        message: 'Project Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

const deleteProject = async (req, res) => {
  try {
    const isExist = await project.findById(req.params.id);

    if (isExist) {
      const deletedProjectInfo = await project.findByIdAndRemove(isExist._id);
      res.status(200).json({
        data: null,
        message: 'Delete ProjectInfo',
      });
    } else {
      res.status(404).json({
        data: null,
        message: 'Project Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

module.exports = {
  createProject,
  getProjects,
  getProject,
  updateProject,
  deleteProject,
};

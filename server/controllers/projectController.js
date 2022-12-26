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
      color: req.body.color,
    });
    const savedProject = await newProject.save();

    res.status(201).json({
      data: savedProject,
      message: 'Create New Project',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
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
      message: error.message,
    });
  }
};

// get info about a project
const getProject = async (req, res) => {
  try {
    const isProjectExist = await project.findById(req.params.id);

    if (isProjectExist) {
      if (isProjectExist.userId === req.userId) {
        res.status(200).json({
          data: isProjectExist,
          message: 'Fetch ProjectInfo',
        });
      } else {
        res.status(403).json({
          data: null,
          message: 'Access Denied',
        });
      }
    } else {
      res.status(404).json({
        data: null,
        message: 'Project Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

// update an existing project
const updateProject = async (req, res) => {
  try {
    const isProjectExist = await project.findById(req.params.id);

    if (isProjectExist) {
      if (isProjectExist.userId === req.userId) {
        const updatedProjectInfo = await project.findByIdAndUpdate(
          isProjectExist._id,
          req.body,
          { new: true }
        );
        res.status(200).json({
          data: updatedProjectInfo,
          message: 'Update ProjectInfo',
        });
      } else {
        res.status(403).json({
          data: null,
          message: 'Access Denied',
        });
      }
    } else {
      res.status(404).json({
        data: null,
        message: 'Project Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

// delete an existing project
const deleteProject = async (req, res) => {
  try {
    const isProjectExist = await project.findById(req.params.id);

    if (isProjectExist) {
      if (isProjectExist.userId === req.userId) {
        const deletedProjectInfo = await project.findByIdAndRemove(
          isProjectExist._id
        );
        res.status(200).json({
          data: null,
          message: 'Delete ProjectInfo',
        });
      } else {
        res.status(403).json({
          data: null,
          message: 'Access Denied',
        });
      }
    } else {
      res.status(404).json({
        data: null,
        message: 'Project Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
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

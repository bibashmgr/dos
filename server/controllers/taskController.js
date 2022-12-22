// models
const task = require('../models/task.js');
const project = require('../models/project.js');

const getTasks = async (req, res) => {
  try {
    const tasks = await task.find({
      userId: req.userId,
    });
    res.status(200).json({
      data: tasks,
      message: 'Fetch All Tasks',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

const getProjectTask = async (req, res) => {
  try {
    const isProjectExist = await project.findById(req.params.id);

    if (isProjectExist) {
      const projectTasks = await task.find({ projectId: isProjectExist._id });
      res.status(404).json({
        data: projectTasks,
        message: 'Fetch Project Tasks',
      });
    } else {
      res.status(404).json({
        data: null,
        message: 'Invalid ProjectId',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

const getTodayTask = async (req, res) => {
  try {
    const todayTasks = await task.find({
      userId: req.userId,
    });
    res.status(200).json({
      data: todayTasks,
      message: 'Fetch Today Tasks',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

const getTask = async (req, res) => {
  try {
    const isTaskExist = await task.findById(req.params.id);

    if (isTaskExist) {
      if (isTaskExist.userId === req.userId) {
        res.status(200).json({
          data: isTaskExist,
          message: 'Fetch TaskInfo',
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
        message: 'Task Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

const createTask = async (req, res) => {
  try {
    const isProjectExist = await project.findById(req.body.projectId);
    if (isProjectExist) {
      const newTask = new task({
        name: req.body.name,
        desc: req.body.desc,
        projectId: req.body.projectId,
        userId: req.userId,
        priority: req.body.priority,
        issueDate: req.body.issueDate,
        dueDate: req.body.dueDate,
        isNotify: req.body.isNotify,
      });
      const savedTask = await newTask.save();

      res.status(201).json({
        data: savedTask,
        message: 'Create New Task',
      });
    } else {
      res.status(404).json({
        data: null,
        message: 'Invalid ProjectId',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

const updateTask = async (req, res) => {
  try {
    const isTaskExist = await task.findById(req.params.id);

    if (isTaskExist) {
      if (isTaskExist.userId === req.userId) {
        const updatedTaskInfo = await task.findByIdAndUpdate(
          isTaskExist._id,
          req.body,
          { new: true }
        );
        res.status(200).json({
          data: updatedTaskInfo,
          message: 'Update TaskInfo',
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
        message: 'Task Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error.message,
    });
  }
};

const deleteTask = async (req, res) => {
  try {
    const isTaskExist = await task.findById(req.params.id);

    if (isTaskExist) {
      if (isTaskExist.userId === req.userId) {
        const deletedTaskInfo = await task.findByIdAndRemove(isTaskExist._id);
        res.status(200).json({
          data: null,
          message: 'Delete TaskInfo',
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
        message: 'Task Not Found',
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
  getTasks,
  getProjectTask,
  getTodayTask,
  getTask,
  createTask,
  updateTask,
  deleteTask,
};

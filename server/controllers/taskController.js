// models
const task = require('../models/task.js');

const getTasks = async (req, res) => {
  try {
    const tasks = await task.find();
    res.status(200).json({
      data: tasks,
      message: 'Fetch all Tasks',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

const getTask = async (req, res) => {
  try {
  } catch (error) {}
};

const createTask = async (req, res) => {
  try {
    const newTask = new task(req.body);
    const savedTask = await newTask.save();

    res.status(201).json({
      data: savedTask,
      message: 'Create new Task',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

const updateTask = async (req, res) => {
  try {
  } catch (error) {}
};

const deleteTask = async (req, res) => {
  try {
  } catch (error) {}
};

module.exports = { createTask, getTask, getTasks, updateTask, deleteTask };

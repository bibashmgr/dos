const mongoose = require('mongoose');

const taskSchema = mongoose.Schema({
  name: {
    type: String,
  },
  desc: {
    type: String,
    default: '',
  },
  projectId: {
    type: String,
  },
  userId: {
    type: String,
  },
  priority: {
    type: String,
  },
  issueDate: {
    type: Date,
  },
  dueDate: {
    type: Date,
  },
  isDone: {
    type: Boolean,
    default: false,
  },
  isNotify: {
    type: Boolean,
  },
});

module.exports = mongoose.model('tasks', taskSchema);

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
  startTime: {
    type: Date,
  },
  endTime: {
    type: Date,
  },
  isDone: {
    type: Boolean,
    default: false,
  },
  isNotify: {
    type: Boolean,
    default: false,
  },
});

module.exports = mongoose.model('tasks', taskSchema);

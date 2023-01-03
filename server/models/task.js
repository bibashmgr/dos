const mongoose = require('mongoose');

const taskSchema = mongoose.Schema(
  {
    name: {
      type: String,
    },
    projectId: {
      type: String,
    },
    userId: {
      type: String,
    },
    issueDate: {
      type: Date,
    },
    issueTime: {
      type: String,
    },
    dueTime: {
      type: String,
    },
    isDone: {
      type: Boolean,
      default: false,
    },
    isNotify: {
      type: Boolean,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model('tasks', taskSchema);

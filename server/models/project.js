const mongoose = require('mongoose');

const projectSchema = mongoose.Schema({
  name: {
    type: String,
  },
  desc: {
    type: String,
    default: '',
  },
  userId: {
    type: String,
  },
  tasks: {
    type: Array,
    default: [],
  },
  icon: {
    type: String,
  },
});

module.exports = mongoose.model('projects', projectSchema);

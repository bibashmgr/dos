const mongoose = require('mongoose');

const projectSchema = mongoose.Schema({
  name: {
    type: String,
  },
  userId: {
    type: String,
  },
  tasks: {
    type: Array,
  },
  icon: {
    type: String,
  },
  color: {
    type: String,
  },
});

module.exports = mongoose.model('projects', projectSchema);

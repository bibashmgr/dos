// models
const user = require('../models/user.js');

const getUsers = async (req, res) => {
  try {
    const users = await user.find();
    res.status(200).json({
      data: users,
      message: 'Fetch all Users',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

module.exports = { getUsers };

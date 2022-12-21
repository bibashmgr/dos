// models
const user = require('../models/user.js');

const getUsers = async (req, res) => {
  try {
    const users = await user.find();
    const newUsers = users.map(({ _id, name, email, avatar }) => {
      return { _id, name, email, avatar };
    });
    res.status(200).json({
      data: newUsers,
      message: 'Fetch All Users',
    });
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

const getUser = async (req, res) => {
  try {
    const userInfo = await user.findById(req.params.id);

    if (userInfo) {
      const { password, ...others } = userInfo._doc;
      res.status(200).json({
        data: others,
        message: 'Fetch UserInfo',
      });
    } else {
      res.status(404).json({
        data: null,
        message: 'User Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

const updateUser = async (req, res) => {
  try {
    const isExist = await user.findById(req.userId);
    if (isExist) {
      const updatedUser = await user.findByIdAndUpdate(req.userId, req.body, {
        new: true,
      });
      const { password, ...others } = updatedUser._doc;
      res.status(200).json({
        data: others,
        message: 'Update UserInfo',
      });
    } else {
      res.status(404).json({
        data: null,
        message: 'User Not Found',
      });
    }
  } catch (error) {
    res.status(400).json({
      data: null,
      message: error,
    });
  }
};

module.exports = { getUsers, getUser, updateUser };

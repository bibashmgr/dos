// models
const user = require('../models/user.js');

const getUser = async (req, res) => {
  try {
    const isUserExist = await user.findById(req.userId);

    if (isUserExist) {
      const { password, ...others } = isUserExist._doc;
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
    const isUserExist = await user.findById(req.userId);
    if (isUserExist) {
      const updatedUser = await user.findByIdAndUpdate(
        isUserExist._id,
        req.body,
        {
          new: true,
        }
      );
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

module.exports = {
  getUser,
  updateUser,
};

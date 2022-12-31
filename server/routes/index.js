const express = require('express');

const router = express.Router();

router.get('/', (req, res) => {
  res.status(200).json({
    data: null,
    message: 'Welcome to RESTFUL API of dos',
  });
});

module.exports = router;

const express = require('express');

const router = express.Router();

router.get('/', (req, res) => {
  res.json('Welcome to RESTFUL API of dos');
});

module.exports = router;

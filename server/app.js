const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');

const indexRoutes = require('./routes/index.js');
const authRoutes = require('./routes/auth.js');
const userRoutes = require('./routes/user.js');
const taskRoutes = require('./routes/task.js');

const app = express();
dotenv.config();

// environment variables
const PORT = process.env.PORT || 9999;
const CONNECTION_URL = process.env.MONGODB_URL;

// middlewares
app.use(
  cors({
    origin: '*',
  })
);
app.use(
  bodyParser.json({
    extended: false,
    limit: '5mb',
  })
);
app.use(
  bodyParser.urlencoded({
    extended: false,
    limit: '5mb',
  })
);

// routes
app.use('/', indexRoutes);
app.use('/api/auth/', authRoutes);
app.use('/api/users/', userRoutes);
app.use('/api/tasks/', taskRoutes);

// creating httpServer
const httpServer = require('http').createServer(app);

// establishing connection
mongoose
  .set('strictQuery', false)
  .connect(CONNECTION_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => {
    console.log('Database Connected');
    httpServer.listen(PORT, () => {
      console.log(`Server running on http://localhost:${PORT}`);
    });
  })
  .catch((error) => console.log(error.message));

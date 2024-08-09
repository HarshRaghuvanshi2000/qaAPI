const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
const morgan = require('morgan');
require('dotenv').config();

const port = process.env.PORT || 3000;

// Middleware
app.use(morgan('dev'));
app.use(express.json()); // Replaced bodyParser.json() with express.json()

// Use routes
const userRoutes = require('./routes/users');
app.use('/api/users', userRoutes);

// Error handling middleware should be the last middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

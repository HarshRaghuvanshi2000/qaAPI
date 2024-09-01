const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const http = require('http');
const WebSocket = require('ws');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

const userRoutes = require('./routes/users');
app.use('/api/users', userRoutes);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});
const mysql = require('mysql2');

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT || 3306 // Optional, in case you specify a different port in .env
});
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the MySQL database.');
});

const server = http.createServer(app);

const callStatuses = {};  // Initialize with callId and userId if needed
const userCallMap = {};   // Map to keep track of which call each user is reviewing

const wss = new WebSocket.Server({ server });

wss.on('connection', (ws) => {
  console.log('A new client connected!');

  ws.on('message', (message) => {
    try {
      const { type, userId, callId, status } = JSON.parse(message);

      if (type === 'UPDATE_STATUS') {
        if (userCallMap[userId]) {
          const previousCallId = userCallMap[userId];
          if (callStatuses[previousCallId] === 'In Progress') {
            callStatuses[previousCallId] = 'Pending';
            broadcastStatusUpdate(previousCallId, 'Pending', ws);
          }
        }

        // Update the status of the new call
        callStatuses[callId] = status;
        userCallMap[userId] = callId;

        broadcastStatusUpdate(callId, status, ws);
      } else if (type === 'SUBMIT_STATUS') {
        // Mark the call as completed
        callStatuses[callId] = 'Completed';
        broadcastStatusUpdate(callId, 'Completed', ws);

        // Execute the SQL update query
        const query = 'UPDATE call_data SET review_status = ? WHERE signal_id = ?';
        db.query(query, [status, callId], (err, results) => {
          if (err) {
            console.error('Error updating database:', err);
            return;
          }
          console.log(`Call with signal_id ${callId} updated to Completed.`);
        });
      }
    } catch (error) {
      console.error('Error handling message:', error);
    }
  });

  ws.on('close', () => {
    console.log('A client disconnected.');
  });
});

function broadcastStatusUpdate(callId, status, ws) {
  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      client.send(JSON.stringify({ type: 'STATUS_UPDATE', callId, status }));
    }
  });
}

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

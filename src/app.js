const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const http = require('http');
const WebSocket = require('ws');
require('dotenv').config();
const mysql = require('mysql2');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

const userRoutes = require('./routes/users');
app.use('/api/users', userRoutes);

app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).send('Something broke!');
});

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT || 3306
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the MySQL database.');
});

const server = http.createServer(app);

const callStatuses = {};  // Stores current status for each callId
const userCallMap = {};   // Maps userId to the call they are currently reviewing

const wss = new WebSocket.Server({ server });

wss.on('connection', (ws) => {
  console.log('A new client connected!');

  // Send current call statuses to the new user
  sendCurrentStatuses(ws);

  ws.on('message', (message) => {
    try {
      const { type, userId, callId, status } = JSON.parse(message);

      if (type === 'UPDATE_STATUS') {
        handleUpdateStatus(userId, callId, status, ws);
      } else if (type === 'SUBMIT_STATUS') {
        handleSubmitStatus(callId, ws);
      }
    } catch (error) {
      console.error('Error handling message:', error);
    }
  });

  ws.on('close', () => {
    console.log('A client disconnected.');
  });
});

// Send the current status of all calls to the new user
function sendCurrentStatuses(ws) {
  for (const [callId, status] of Object.entries(callStatuses)) {
    ws.send(JSON.stringify({ type: 'STATUS_UPDATE', callId, status }));
  }
}

function handleUpdateStatus(userId, callId, status, ws) {
  if (userCallMap[userId]) {
    const previousCallId = userCallMap[userId];
    if (callStatuses[previousCallId] === 'Being Reviewed') {
      callStatuses[previousCallId] = 'Pending';  // Set the previous call to Pending
      broadcastStatusUpdate(previousCallId, 'Pending', ws);
    }
  }

  // Update the status of the new call to 'Being Reviewed' for others and 'Playing' for the current user
  callStatuses[callId] = 'Being Reviewed';
  userCallMap[userId] = callId;

  broadcastStatusUpdate(callId, 'Being Reviewed', ws);
  ws.send(JSON.stringify({ type: 'STATUS_UPDATE', callId, status: 'Pending' }));
}

function handleSubmitStatus(callId, ws) {
  // Mark the call as completed
  callStatuses[callId] = 'Completed';
  broadcastStatusUpdate(callId, 'Completed', ws);

  // Execute the SQL update query
  const query = 'UPDATE call_data SET review_status = ? WHERE signal_id = ?';
  db.query(query, ['Completed', callId], (err, results) => {
    if (err) {
      console.error('Error updating database:', err);
      return;
    }
    console.log(`Call with signal_id ${callId} updated to Completed.`);
  });
}

function broadcastStatusUpdate(callId, status, ws) {
  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN && client !== ws) {
      client.send(JSON.stringify({ type: 'STATUS_UPDATE', callId, status }));
    }
  });
}

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

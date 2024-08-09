const db = require('../db')

// New function to get data from co_qa_data within a date range
exports.getCoQaDataByDateRange = (req, res) => {
  const { startDate, endDate } = req.query;

  // Ensure the dates are in the correct format
  const formattedStartDate = new Date(startDate).toISOString().slice(0, 19).replace('T', ' ');
  const formattedEndDate = new Date(endDate).toISOString().slice(0, 19).replace('T', ' ');

  // SQL query to fetch data between startDate and endDate
  const query = `SELECT * FROM co_qa_data WHERE co_call_time BETWEEN ? AND ?`;

  db.query(query, [formattedStartDate, formattedEndDate], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
};


exports.getCallData = (req, res) => {
  const { callType} = req.query;
  const query = `SELECT * FROM call_data WHERE is_active = ? LIMIT 50`;

  db.query(query,'Y', (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
};


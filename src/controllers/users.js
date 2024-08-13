const db = require('../db')

// New function to get data from co_qa_data within a date range
// exports.getCoQaDataByDateRange = (req, res) => {
//   const { startDate, endDate } = req.query;

//   // Ensure the dates are in the correct format
//   const formattedStartDate = `${startDate.split('-').reverse().join('-')} 00:00:00`;
//   const formattedEndDate = `${endDate.split('-').reverse().join('-')} 23:59:59`;

//   const query = `
//   SELECT
//     c.signal_id,
//     c.sco_qa_time,
//     c.sop_score,
//     c.active_listening_score,
//     c.relevent_detail_score,
//     c.address_tagging_score,
//     c.call_handled_time_score,
//     c.sco_employee_code,
//     c.sco_remarks,
//     d.review_status,
//     d.agent_name,
//     d.agent_full_name,
//     d.call_duration_millis,
//     d.signal_landing_time
//   FROM co_qa_data c
//   JOIN call_data d
//     ON c.signal_id = d.signal_id
//   WHERE
//     d.review_status = 'completed'
//   ORDER BY d.signal_landing_time DESC;
// `;

//   // Form the final query with parameters inserted
//   const formattedQuery = query.replace('?', `'${formattedStartDate}'`).replace('?', `'${formattedEndDate}'`);

//   // Log the fully formed query
//   console.log('Executing query:', formattedQuery);

//   // Execute the query with the provided date range
//   db.query(query, [formattedStartDate, formattedEndDate], (err, results) => {
//     if (err) {
//       return res.status(500).json({ error: err.message });
//     }
//     res.json(results);
//   });
// };


exports.getCoQaDataByDateRange = (req, res) => {
  const { startDate, endDate } = req.query;

  const formattedStartDate = `${startDate.split('-').reverse().join('-')} 00:00:00`;
  const formattedEndDate = `${endDate.split('-').reverse().join('-')} 23:59:59`;

  const query = `
  SELECT
    c.signal_id,
    c.sco_qa_time,
    c.sop_score,
    c.active_listening_score,
    c.relevent_detail_score,
    c.address_tagging_score,
    c.call_handled_time_score,
    c.sco_employee_code,
    c.sco_remarks,
    d.review_status,
    d.agent_name,
    d.agent_full_name,
    d.call_duration_millis,
    d.signal_landing_time
  FROM co_qa_data c
  JOIN call_data d
    ON c.signal_id = d.signal_id
  WHERE
    d.review_status = 'completed'
  ORDER BY d.signal_landing_time DESC;
`;

  db.query(query, [formattedStartDate, formattedEndDate], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    // Process the results to merge data by agent_name
    const aggregatedData = results.reduce((acc, curr) => {
      const { agent_name } = curr;

      if (!acc[agent_name]) {
        acc[agent_name] = {
          co_employee_code: curr.agent_name,
          co_name: curr.agent_full_name,
          total_calls: 0,
          total_completed_calls: 0,
          sop_score: 0,
          active_listening_score: 0,
          relevent_detail_score: 0,
          address_tagging_score: 0,
          call_handled_time_score: 0,
          call_duration_millis: 0,
        };
      }

      acc[agent_name].total_calls += 1;
      acc[agent_name].total_completed_calls += 1;
      acc[agent_name].sop_score += curr.sop_score;
      acc[agent_name].active_listening_score += curr.active_listening_score;
      acc[agent_name].relevent_detail_score += curr.relevent_detail_score;
      acc[agent_name].address_tagging_score += curr.address_tagging_score;
      acc[agent_name].call_handled_time_score += curr.call_handled_time_score;
      acc[agent_name].call_duration_millis += parseInt(curr.call_duration_millis, 10);

      return acc;
    }, {});

    const aggregatedArray = Object.values(aggregatedData).map(agent => {
      const totalScores = agent.sop_score + agent.active_listening_score + agent.relevent_detail_score + agent.address_tagging_score + agent.call_handled_time_score;
      const averageScore = totalScores / 5; // Since there are 5 different scores

      return {
        ...agent,
        average_score: averageScore,
        average_call_duration_millis: agent.call_duration_millis / agent.total_calls,
      };
    });

    res.json(aggregatedArray);
  });
};





exports.getCallData = (req, res) => {
  const { signalType } = req.query;
  const query = `SELECT * FROM call_data WHERE is_active = 'Y' and signal_type = ?`;

  db.query(query, [signalType], (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
};

// Function to handle the POST request and insert data into the database
exports.createCoQaData = (req, res) => {
  console.log(req);
  const {
    signalId,
    scoQaTime,
    sopScore,
    activeListeningScore,
    releventDetailScore,
    addressTaggingScore,
    callHandledTimeScore,
    scoEmployeeCode,
    scoRemarks
  } = req.body;

  // Validate that all required fields are present
  if (
    signalId === undefined ||
    scoQaTime === undefined ||
    sopScore === undefined ||
    activeListeningScore === undefined ||
    (releventDetailScore === undefined) || // Can be NULL
    (addressTaggingScore === undefined) || // Can be NULL
    (callHandledTimeScore === undefined) || // Can be NULL
    scoEmployeeCode === undefined ||
    (scoRemarks === undefined)
  ) {
    return res.status(400).json({ error: 'All required fields must be provided.' });
  }

  // SQL query to insert the data into the database
  const insertQuery = `
    INSERT INTO co_qa_data (
      signal_id,
      sco_qa_time,
      sop_score,
      active_listening_score,
      relevent_detail_score,
      address_tagging_score,
      call_handled_time_score,
      sco_employee_code,
      sco_remarks,
      is_active
    )
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,'Y')
  `;

  // SQL query to update the review_status in the call_data table
  const updateQuery = `
    UPDATE call_data
    SET review_status = 'completed'
    WHERE signal_id = ?
  `;

  // Start a transaction
  db.beginTransaction(err => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }

    // Insert data into co_qa_data
    db.query(
      insertQuery,
      [
        signalId,
        scoQaTime,
        sopScore,
        activeListeningScore,
        releventDetailScore || null, // Handle NULL values
        addressTaggingScore || null, // Handle NULL values
        callHandledTimeScore || null, // Handle NULL values
        scoEmployeeCode,
        scoRemarks
      ],
      (err, results) => {
        if (err) {
          return db.rollback(() => {
            res.status(500).json({ error: err.message });
          });
        }

        // Update the review_status in call_data
        db.query(
          updateQuery,
          [signalId],
          (err, results) => {
            if (err) {
              return db.rollback(() => {
                res.status(500).json({ error: err.message });
              });
            }

            // Commit the transaction
            db.commit(err => {
              if (err) {
                return db.rollback(() => {
                  res.status(500).json({ error: err.message });
                });
              }

              res.status(201).json({ message: 'Data successfully inserted and call_data updated', id: results.insertId });
            });
          }
        );
      }
    );
  });
};

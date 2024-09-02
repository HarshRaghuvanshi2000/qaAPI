require('dotenv').config(); // Load environment variables from .env file
const axios = require('axios');
const mysql = require('mysql2/promise');

// Database configuration
const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT || 3306
};

const IP_ADDR = process.env.IP_ADDR; // Replace with actual IP address from .env
const PORT = process.env.PORT; // Replace with actual port from .env

async function fetchDataAndInsert() {
  let connection;

  try {
    // Make the HTTP GET request to the API
    // const response = await axios.get(`http://${IP_ADDR}:${PORT}/ERSSBiServer/bi/v1/auth/quality/signal-info/complex`, {
    //   params: {
    //     startTime: 1722882600000,
    //     endTime: 1722882900000,
    //     isSummary: false,
    //     asDownloadable: true,
    //     pageNumber: 0,
    //     pageSize: 500
    //   }
    // });

    // // Extract data from the response
    // const data = response.data.returnList;

    // // Create a MySQL connection
    connection = await mysql.createConnection(dbConfig);

    // // Prepare the SQL query for batch insertion
    // const insertQuery = `
    //   INSERT INTO call_data (
    //     signal_id,
    //     event_id,
    //     signal_type,
    //     signal_landing_time,
    //     event_maintype,
    //     event_subtype,
    //     voip_extn,
    //     agent_name,
    //     addl_signal_info,
    //     voice_path,
    //     call_pick_duration_millis,
    //     call_duration_millis,
    //     event_registration_time,
    //     agent_full_name,
    //     priority,
    //     district_code,
    //     victim_name,
    //     victim_age,
    //     victim_gender,
    //     victim_address,
    //     near_ps,
    //     addl_info,
    //     signal_status,
    //     review_status,
    //     is_active,
    //     created_at,
    //     updated_at
    //   ) VALUES ?
    // `;

    // // Map the data to an array of values
    // const values = data.map(item => {
    //   const eventInfo = item.eventBasicInfo;
    //   const victimInfo = eventInfo.victimInfo;
    //   return [
    //     item.signalId,
    //     item.eventId,
    //     null, // signal_type is null initially
    //     item.signalLandingTime,
    //     null, // event_maintype is null
    //     null, // event_subtype is null
    //     item.voipExtn,
    //     item.agentName,
    //     item.addlSignalInfo,
    //     item.voicePath,
    //     item.callPickDurationMillis,
    //     item.callDurationMillis,
    //     item.eventRegistrationTime,
    //     item.agentFullName,
    //     eventInfo.priority,
    //     eventInfo.districtCode,
    //     victimInfo.personName,
    //     victimInfo.age, // victim_age is null
    //     victimInfo.gender, // victim_gender is null
    //     victimInfo.personAddress,
    //     eventInfo.nearPs,
    //     eventInfo.addlInfo,
    //     null, // signal_status is null initially
    //     'Pending', // review_status default to Pending
    //     'Y', // is_active default to Y
    //     new Date(), // created_at
    //     new Date()  // updated_at
    //   ];
    // });

    // Execute the batch insert query
    // await connection.query(insertQuery, [values]);

    // Update signal_type based on signal_status
    const updateSignalTypeQuery = `
      UPDATE call_data cd
      JOIN master_signal_status mss ON cd.signal_status = mss.signal_status
      JOIN master_signal_type mst ON mss.master_signal_type_id = mst.id
      SET cd.signal_type = mst.signal_type_id
      WHERE cd.signal_type IS NULL
    `;
    await connection.execute(updateSignalTypeQuery);

    // Get data from master_signal_type
    const [signalTypes] = await connection.execute('SELECT * FROM master_signal_type WHERE is_active = "Y"');

    for (const type of signalTypes) {
      const percentage = type.percentage_of_calls_qa;
      const maxLimit = type.maximum_limit;
      const signalTypeId = type.signal_type_id;

      // Fetch the distinct agent names and count them for the current signal_type
      const [callData] = await connection.execute(`
        SELECT id, agent_name
        FROM call_data
        WHERE signal_type = ?
          AND STR_TO_DATE(signal_landing_time, '%d-%m-%Y %H:%i') BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
          AND is_qa_active = 'N'
      `, [signalTypeId]);

      // Calculate the number of calls to review
      const totalCalls = callData.length;
      const numberOfCalls = Math.min(Math.ceil((percentage / 100) * totalCalls), maxLimit);

      // Get distinct agent names
      const [distinctAgents] = await connection.execute(`
        SELECT DISTINCT agent_name
        FROM call_data
        WHERE signal_type = ?
          AND STR_TO_DATE(signal_landing_time, '%d-%m-%Y %H:%i') BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
          AND is_qa_active = 'N'
      `, [signalTypeId]);

      const uniqueAgentCount = distinctAgents.length;
      console.log(uniqueAgentCount);

      // If numberOfCalls is greater than or equal to uniqueAgentCount,
      // ensure at least one call per agent is marked for QA
      let callsToSelect = numberOfCalls;
      if (numberOfCalls >= uniqueAgentCount) {
        callsToSelect = numberOfCalls - uniqueAgentCount;
      }

      // Select the required number of calls
      const [selectedCalls] = await connection.execute(`
        SELECT id
        FROM (
          SELECT id
          FROM call_data
          WHERE signal_type = ?
            AND STR_TO_DATE(signal_landing_time, '%d-%m-%Y %H:%i') BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
            AND is_qa_active = 'N'
          ORDER BY RAND()
          LIMIT ?
        ) AS subquery
      `, [signalTypeId, callsToSelect]);

      // Ensure at least one call per unique agent is included
      if (uniqueAgentCount > 0) {
        const [callsForAgents] = await connection.execute(`
          SELECT id
          FROM call_data
          WHERE signal_type = ?
            AND STR_TO_DATE(signal_landing_time, '%d-%m-%Y %H:%i') BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE()
            AND is_qa_active = 'N'
            AND agent_name IN (SELECT DISTINCT agent_name FROM call_data WHERE signal_type = ? AND STR_TO_DATE(signal_landing_time, '%d-%m-%Y %H:%i') BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND CURDATE() AND is_qa_active = 'N')
          ORDER BY agent_name
        `, [signalTypeId, signalTypeId]);

        for (const call of callsForAgents) {
          if (!selectedCalls.find(c => c.id === call.id)) {
            selectedCalls.push(call);
          }
        }
      }

      // Update the selected calls to is_qa_active = 'Y'
      const idsToUpdate = selectedCalls.map(c => c.id);
      if (idsToUpdate.length > 0) {
        await connection.execute(`
          UPDATE call_data
          SET is_qa_active = 'Y'
          WHERE id IN (?)
        `, [idsToUpdate]);
      }
    }

    console.log('Data inserted and updated successfully!');

    // Insert log data into the cron_job_logs table
    const logQuery = `
      INSERT INTO cron_job_logs (log_details, created_at, updated_at)
      VALUES (?, NOW(), NOW())
    `;
    await connection.execute(logQuery, [JSON.stringify({ success: true })]);

  } catch (error) {
    console.error('Error fetching data or inserting into database:', error.message);
  } finally {
    if (connection) {
      await connection.end();
    }
  }
}

// Execute the function
fetchDataAndInsert();
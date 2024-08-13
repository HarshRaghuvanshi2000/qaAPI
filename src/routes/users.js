const express = require('express');
const router = express.Router();
const usersController = require('../controllers/users');

// New route to get data from co_qa_data based on date range
router.get('/co-qa-data', usersController.getCoQaDataByDateRange);
router.get('/call-data', usersController.getCallData);
router.post('/create-coqa-data', usersController.createCoQaData);

module.exports = router;

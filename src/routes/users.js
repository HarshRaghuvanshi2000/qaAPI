const express = require('express');
const router = express.Router();
const usersController = require('../controllers/users');

// New route to get data from co_qa_data based on date range
router.get('/co-qa-data', usersController.getCoQaDataByDateRange);
router.get('/call-data', usersController.getCallData);
router.post('/create-coqa-data', usersController.createCoQaData);
router.post('/update-status', usersController.updateStatus);
router.get('/call-summary', usersController.getCallSummaryBySignalType);
router.get('/sco-detailed-data', usersController.getScoDetailedData);
router.get('/signal-types', usersController.getSignalTypes);
router.post('/signal-types', usersController.postSignalTypes);


module.exports = router;

const path = require('path');
const express = require('express');

const router = express.Router();
const user = require('../controllers/user.controllers');



router.get('/signin', user.getSignin);

router.get('/signup', user.getSignup);

module.exports = router;
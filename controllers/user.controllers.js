const sequelize = require('sequelize');
const db = require('../config/db');


// get signin
exports.getSignin = (req, res, next) => {
    res.status(200).render('user/login/signIn');
}

// get signup
exports.getSignup = (req, res, next) => {
    res.status(200).render('user/login/signUp');
}
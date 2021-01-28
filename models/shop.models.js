const Sequelize = require('sequelize');
const db = require('../config/db');

const users = db.define('users', {
    name: {
        type: Sequelize.STRING
    }
}, {
    timestamps: false
});

module.exports = users;
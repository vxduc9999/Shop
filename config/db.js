const Sequelize = require('sequelize');


module.exports = new Sequelize('shop', 'postgres', '123', {
    host: 'localhost',
    dialect: 'postgres',
    operatorsAliases: false,
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
});
const Sequelize = require ("sequelize");

const connection = new Sequelize ('guiapress', 'selvagedev', 'Amalia03', {
    host: 'mysql742.umbler.com',
    dialect: 'mysql'
});

module.exports = connection;
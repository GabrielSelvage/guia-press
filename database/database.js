const Sequelize = require ("sequelize");

const connection = new Sequelize ('guiapress2', 'selvagedev2', 'Amalia03', {
    host: 'mysql742.umbler.com',
    dialect: 'mysql'
});

module.exports = connection;
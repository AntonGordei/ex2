const Sequelize = require("sequelize")

const sequelize = new Sequelize("localization", "test", "test1234", {
    dialect: "mssql",
    host: "localhost",
    port: 1433,
    dialectOptions: {
        "options": {
            validateBulkLoadParameters: true
        }
    },
    define: {
        timestamps: false
    }
})

module.exports = sequelize

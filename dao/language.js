const Sequelize = require("sequelize")

const sequelize = require('../dal/dal')

const Language = sequelize.define("Language", {
    LanguageId: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    Code: {
        type: Sequelize.STRING
    },
})

module.exports = Language

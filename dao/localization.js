const Sequelize = require("sequelize")

const sequelize = require('../dal/dal')

const Localization = sequelize.define("Localization", {
    LocalizationId: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    BookId: {
        type: Sequelize.INTEGER,
    },

    LanguageId: {
        type: Sequelize.INTEGER,
    },
    Value: {
        type: Sequelize.STRING
    },
})

module.exports = Localization

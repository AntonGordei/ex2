const Sequelize = require("sequelize")

const sequelize = require('../dal/dal')

const Book = sequelize.define("Book", {
    BookId: {
        type: Sequelize.INTEGER,
        primaryKey: true
    },
    Name: {
        type: Sequelize.STRING
    },
})

module.exports = Book

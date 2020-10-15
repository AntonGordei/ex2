const Language = require('../dao/language')
const Book = require('../dao/book')
const Localization = require('../dao/localization')

const getLanguageId = async (lang) => {
    return await Language.findOne({where: {Code: lang}})
        .then(res => res.LanguageId)
        .catch(err=>console.log(err))
}

const getBooks = async () => {
    return await Book.findAll({raw:true})
        .then(books => books)
        .catch(err=>console.log(err))
}

const getLocalisation = async (bookId, languageId) => {
    return await Localization.findOne({where: {BookId: bookId, LanguageId: languageId}})
        .then(res => res.Value)
        .catch(err=>console.log(err))
}

const getBooksByLanguage = async (lang) => {

    const booksList = []
    const lngId = await getLanguageId(lang)
    const books = await getBooks()
    for (let i in books) {
        const localisationName = await getLocalisation(books[i].BookId, lngId)
        booksList.push({ Id: books[i].BookId, name: books[i].Name, ...(localisationName?{localisationName}: null) })
    }
    return new Promise(((resolve) => {
        resolve(JSON.stringify(booksList))
    }))
}

module.exports = getBooksByLanguage

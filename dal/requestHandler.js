const sql = require('mssql')


const getBooksByLanguage = async (lang) => {
    await sql.connect('mssql://test:test1234@localhost/localization')
    const booksList = await sql.query`
    SELECT b.BookId, ISNULL(i.Value,b.Name) as Name
FROM Books b
left join Localizations i
on i.BookId=b.BookId AND LanguageId=(SELECT LanguageId FROM Languages WHERE Code = ${lang})
    `
    console.log(lang, booksList.recordset)
    return new Promise(((resolve) => {
        resolve(JSON.stringify(booksList.recordset))
    }))
}

module.exports = getBooksByLanguage

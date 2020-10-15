const requestHandler = require('../dal/requestHandler')
const express = require('express')
const app = express()
const port = 8080

app.use(express.static('./public'))

app.get('/lang:lang', (req, res) => {
   requestHandler(req.params.lang.slice(1))
       .then(rez => res.status(201).json(rez))
       .catch(err => res.status(err[0]).json(err[1]))
})

app.listen(port, () => {
    console.log(`listening at http://localhost:${port}`)
})

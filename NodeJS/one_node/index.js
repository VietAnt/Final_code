
var express = require('express');
var app = express();
/**
 * Cau hinh body-parser
 */
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));



/*
**Cac_Route
*/
 require('./app/routes/home.router')(app);
 require('./app/routes/book.router')(app);

// app.use('/', homeRouter);
// app.use('/', bookRouter);


app.listen(3000, function(){
    console.log("Server listening on http://localhost:3000");
});
var mysql = require('mysql');

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'demo_node_api',
});

connection.connect(function(err){
    if(err) {
        console.log("Ket Noi Khong Thanh Cong");
    }
});

module.exports = connection;
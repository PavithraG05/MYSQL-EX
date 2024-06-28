const mysql = require('mysql2');

const conn = mysql.createConnection({
    host:"localhost",
    port:"3306",
    user:"root",
    password:"root1405",
    database:"mydb"
})

conn.connect(function(err){
    if(err){
        console.log(`Error in connecting to database: ${err.stack}`);
        return;
    }
    console.log("Database Connected");
})
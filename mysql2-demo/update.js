const mysql = require('mysql2');

const conn = mysql.createConnection({
    host:"localhost",
    port:"3306",
    user:"root",
    password:"root1405",
    database:"mydb1"
})

conn.connect(function(err){
    if(err){
        console.log(`Error in connecting to database: ${err.stack}`);
        return;
    }
    console.log("Database Connected");

    let sql = "UPDATE test SET name = ? WHERE name = ?";
    let values = ['lekhi','loki'];
    conn.query(sql,values, (err, result) => {
        if(err){
            console.log(`Error in updating result ${err.stack}`);
            return
        }
        console.log("Result" + JSON.stringify(result));
    })

    conn.end();
})
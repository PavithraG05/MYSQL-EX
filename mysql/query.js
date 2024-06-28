const mysql = require('mysql');

const con = mysql.createConnection({
    host: "localhost",
    port: "3306",
    user: "root",
    password: "root1405"
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");

    
    //Create Database query
    // let sql = 'CREATE DATABASE mydb1';
    // con.query(sql, function (err, result) {
    //   if (err) throw err;
    //   console.log("Result: " + JSON.stringify(result));
    // });

    let sql = 'use mydb1';
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log("Result: " + JSON.stringify(result));
    });

    // create table query
    // sql = 'CREATE TABLE test(ID INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100));';
    // con.query(sql, function (err, result) {
    //     if (err) throw err;
    //     console.log("Result: " + JSON.stringify(result));
    // });

    //Insert multiple values
    // sql = 'INSERT INTO test (name) values?';
    // let values = [
    //     ['pavi'],
    //     ['prasanna'],
    //     ['ravi']
    // ];
    // con.query(sql,[values], function (err, result) {
    //     if (err) throw err;
    //     console.log("Result: " + JSON.stringify(result));
    // });

    //insert one value to get id
    // sql = "INSERT INTO test (name) VALUES ('Michelle')";
    // con.query(sql, function (err, result) {
    //     if (err) throw err;
    //     console.log("1 record inserted, ID: " + result.insertId);
    // });

    //using select query and dynamically passing the value
    let query = 'pavi';
    sql = "SELECT * FROM test WHERE name = ?";
    con.query(sql,[query], function (err, result) {
        if (err) throw err;
        console.log("result " + JSON.stringify(result));
    });
});
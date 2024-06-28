const sequelize = require('sequelize')

const conn = new sequelize('mydb3', 'root', 'root1405',{
    host: "localhost",
    dialect: "mysql",
    pool: {
        max: 5,
        min: 0,
        idle: 10000,
        acquire: 30000
      }
})

conn.authenticate()
    .then(() => {
        console.log("Connected to database")
    })
    .catch((err) => {
        console.log("Error in connecting to database")
    })
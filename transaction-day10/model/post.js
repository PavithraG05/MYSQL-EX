const {Sequelize, DataTypes} = require('sequelize')

const sequelize = new Sequelize('mydb2','root','root1405',{
    host:"localhost",
    dialect:"mysql"
})

const Post = sequelize.define('Post',{
    title:{
        type: DataTypes.STRING,
        allowNull: false
    },
    content:{
        type: DataTypes.TEXT,
        allowNull: false
    }
})

const User = require('./user')
User.hasMany(Post)
Post.belongsTo(User)

async function syncModel() {
    await Post.sync()
    console.log('Post model was synchronized successfully.')
  }

syncModel()
module.exports = Post
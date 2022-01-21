module.exports = (sequelize, DataTypes) =>{
    const User = sequelize.define("User", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        name: {
            // allowNull: false,
            type: DataTypes.STRING(500),
        },
        age: {
            // allowNull: false,
            type: DataTypes.INTEGER,
        },
        gender: {
            // allowNull: false,
            type: DataTypes.STRING,
        },
        contact:{
            // allowNull: false,
            type: DataTypes.STRING(500),
        },
        email: {
            // allowNull: false,
            type: DataTypes.STRING,
        },
        password: {
            // allowNull: false,
            type: DataTypes.STRING(1000),
        }
    })
    return User;
}
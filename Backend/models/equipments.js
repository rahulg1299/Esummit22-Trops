module.exports = (sequelize, DataTypes) =>{
    const Equipment = sequelize.define("Equipment", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        name: {
            allowNull: false,
            type: DataTypes.STRING(500),
        },
        toBuy: {
            type: DataTypes.BOOLEAN,
            default: false
        },
        address: {
            type: DataTypes.TEXT('long'),
        },
        description: {
            type: DataTypes.TEXT('long'),
        },
        cost :{
            allowNull: false,
            type : DataTypes.INTEGER
        },
        coverImg:{
            type: DataTypes.TEXT('long')
        }


    })
    return Equipment;
}
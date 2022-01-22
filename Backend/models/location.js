module.exports = (sequelize, DataTypes) =>{
    const Location = sequelize.define("Location", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        name: {
            // allowNull: false,
            type: DataTypes.STRING,
        },
        address: {
            type: DataTypes.TEXT('long'),
        },
        description: {
            type: DataTypes.STRING(1000),
        },
        contact: {
            type: DataTypes.STRING,
        },
        coverImg:{
            type: DataTypes.STRING
        }
    })

    return Location;
}
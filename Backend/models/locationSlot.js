module.exports = (sequelize, DataTypes) =>{
    const LocationSlot = sequelize.define("LocationSlot", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        slot: {
            // allowNull: false,
            type: DataTypes.DATE,
        },
        status: {
            type: DataTypes.STRING,
        },
    })

    return LocationSlot;
}
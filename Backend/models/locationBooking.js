module.exports = (sequelize, DataTypes) =>{
    const LocationBooking = sequelize.define("LocationBooking", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
    })
    return LocationBooking;
}
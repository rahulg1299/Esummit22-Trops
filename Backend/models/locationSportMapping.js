module.exports = (sequelize, DataTypes) =>{
    const LocationSportMapping = sequelize.define("LocationSportMapping", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
    })
    return LocationSportMapping;
}
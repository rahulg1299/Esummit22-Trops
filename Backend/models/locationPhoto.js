module.exports = (sequelize, DataTypes) =>{
    const LocationPhotos = sequelize.define("LocationPhotos", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
        img: {
            type: DataTypes.STRING(1000),
        }
    })
    return LocationPhotos;
}
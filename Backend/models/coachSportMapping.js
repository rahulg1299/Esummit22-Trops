module.exports = (sequelize, DataTypes) =>{
    const CoachSportMapping = sequelize.define("CoachSportMapping", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
    })
    return CoachSportMapping;
}
module.exports = (sequelize, DataTypes) =>{
    const InstituteSportMapping = sequelize.define("InstituteSportMapping", {
        id: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            unique: true,
            type: DataTypes.INTEGER
        },
    })
    return InstituteSportMapping;
}
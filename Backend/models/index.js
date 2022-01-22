"use strict";

const fs = require("fs");
const path = require("path");
const Sequelize = require("sequelize");
const basename = path.basename(__filename);
const env = process.env.NODE_ENV || "development";
const config = require(__dirname + "/../config/config.json")[env];
const db = {};

let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(
    config.database,
    config.username,
    config.password,
    config
  );
}

fs.readdirSync(__dirname)
  .filter((file) => {
    return (
      file.indexOf(".") !== 0 && file !== basename && file.slice(-3) === ".js"
    );
  })
  .forEach((file) => {
    const model = require(path.join(__dirname, file))(
      sequelize,
      Sequelize.DataTypes
    );
    db[model.name] = model;
  });

Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

// // ASSOCIATIONS - FOREIGN KEYS

db.Equipment.hasMany(db.EquipmentPhotos, { foreignKey: "equipmentId" });
db.Equipment.belongsTo(db.EquipmentType, { foreignKey: "equipmentTypeId" })
db.Equipment.belongsTo(db.Sport, { foreignKey: 'sportId' })

db.EquipmentPhotos.belongsTo(db.Equipment, { foreignKey: "equipmentId" })


db.EquipmentType.hasMany(db.Equipment, { foreignKey: "equipmentTypeId" })



db.Sport.hasMany(db.Equipment, { foreignKey: 'sportId' })
db.Sport.hasMany(db.Coach, { foreignKey: 'sportId' })
db.Sport.hasMany(db.InstituteSportMapping, {foreignKey : 'sportId'})
db.Sport.hasMany(db.LocationSportMapping, {foreignKey : 'sportId'})

db.Coach.belongsTo(db.Sport, {foreignKey : 'sportId'})

db.User.hasMany(db.LocationSlot, {foreignKey : 'userId'})


db.Institute.hasMany(db.InstitutePhoto, {foreignKey: 'instituteId'})
db.Institute.hasMany(db.InstituteSportMapping , {foreignKey: 'instituteId'})
db.Institute.hasMany(db.InstituteFeedback, {foreignKey : 'instituteId'})


db.InstituteSportMapping.belongsTo(db.Institute , {foreignKey: 'instituteId'})
db.InstituteSportMapping.belongsTo(db.Sport, {foreignKey: 'sportId'})

db.InstitutePhoto.belongsTo(db.Institute, {foreignKey: 'instituteId'})


db.InstituteFeedback.belongsTo(db.Institute, {foreignKey : 'instituteId'})

db.Location.hasMany(db.LocationPhoto, {foreignKey: 'locationId'})
db.Location.hasMany(db.LocationSlot, {foreignKey : 'locationId'})
db.Location.hasMany(db.LocationSportMapping , {foreignKey : 'locationId'})

db.LocationPhoto.belongsTo(db.Location , {foreignKey : 'locationId'})

db.LocationSlot.belongsTo(db.Location, {foreignKey : 'locationId'})
db.LocationSlot.belongsTo(db.User, {foreignKey : 'userId'})


db.LocationSportMapping.belongsTo(db.Location, {foreignKey : 'locationId'})
db.LocationSportMapping.belongsTo(db.Sport, {foreignKey : 'sportId'})


db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;

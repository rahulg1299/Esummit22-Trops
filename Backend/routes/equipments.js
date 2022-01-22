const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");


router.get('/:equipment_id',(req,res) =>{
    const data = {}

    Promise.all([
        db.Equipment.findOne({where : {id: req.params.equipment_id}}),
        db.EquipmentPhotos.findAll({where :{equipmentId: req.params.equipment_id}}),
    ]).then(value => {
        data.equipment = value[0];
        data.equipment_img = value[1];
        res.send(data);
    }).catch(err => console.log(err));
})

router.get('/', (req,res) =>{
    const data ={}
    
    Promise.all([
        db.EquipmentType.findAll(),
        db.Equipment.findAll(),
    ]).then(value => {
        data.AllequipmentType = value[0];
        data.equipments = value[1];
        data.sell = value[1].map((e)=>{
            return e.toBuy === 1
        });
 
        data.Buy = value[1].map((e)=>{
         return e.toBuy === 0
        });
 
        data.display = value[0].slice(0,5);

        res.send(data);
    }).catch(err => console.log(err));
})

router.get('/:equipmentType_id', (req,res) =>{
    const res ={}
    Promise.all([
        db.EquipmentType.findOne({where:{ id : req.params.equipmentType_id}}),
        db.Equipment.findAll({where : {equipmentTypeId: req.params.equipment_id}}),
    ]).then(value => {
        data.equipmentType = value[0];
        data.equipments = value[1];
        res.send(data);
    }).catch(err => console.log(err));
})



router.delete('/:equipment_id', [authJwt.verifyToken], (req, res) =>{
    db.Equipment.destroy({
        where:{
            id: req.params.equipment_id,
        }
    })
    .then(() => res.send("deleted"))
    .catch(err => console.log(err));
})

router.put('/:equipment_id', [authJwt.verifyToken], (req,res) =>{

    db.Equipment.update({
        name: req.body.name,
        toBuy: req.body.name,
        address: req.body.address,
        description: req.body.description,
        cost :req.body.cost,
        },
        {
            where:{
                id: req.params.sport_id
            }
        }
    )
    .then(eqp => res.send(eqp))
    .catch(err => console.log(err));
})

module.exports = router;

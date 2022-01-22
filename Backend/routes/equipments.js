const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");

// get single equipment
router.get('/:equipment_id',(req,res) =>{
    const data = {}

    Promise.all([
        db.Equipment.findOne({where : {id: req.params.equipment_id}}),
        db.EquipmentPhotos.findAll({where :{equipmentId: req.params.equipment_id}}),
    ]).then(value => {
        data.equipment = value[0];
        data.equipmentImages = value[1];
        res.send(data);
    }).catch(err => console.log(err));
})

// get equipments
router.get('/', (req,res) =>{
    
    const query = {
        where : {
            toBuy : false,
        }
    }
    if(req.query.equipmentTypeId != undefined)
        query.where.equipmentTypeId = req.query.equipmentTypeId
    
    
    if(req.query.sportId != undefined)
        query.where.sportId = req.query.sportId

    if(req.query.toBuy === true)
        query.where.toBuy = true

    
    
    if(req.query.limit != undefined)
        query.limit = parseInt(req.query.limit);
    
    if(req.query.offset != undefined)
        query.offset = parseInt(req.query.offset);


    Promise.all([
        db.Equipment.findAll(query),
    ]).then(value => {
        res.send(value);
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
        toBuy: req.body.toBuy,
        address: req.body.address,
        description: req.body.description,
        cost :req.body.cost,
        coverImg: req.body.coverImg
        },
        {
            where:{
                id: req.params.equipment_id
            }
        }
    )
    .then(eqp => res.send(eqp))
    .catch(err => console.log(err));
})

router.post('/', [authJwt.verifyToken], (req,res) =>{

    db.Equipment.create({
        name: req.body.name,
        toBuy: req.body.toBuy,
        address: req.body.address,
        description: req.body.description,
        cost :req.body.cost,
        coverImg: req.body.coverImg
        }
    )
    .then(eqp => res.send(eqp))
    .catch(err => console.log(err));
})

module.exports = router;

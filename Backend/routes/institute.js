const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");


router.get('/:institute_id',(req,res) =>{
    
    db.Institute.findOne({where : {id: req.params.institute_id}})
    .then(institute =>{ res.send(institute)})
    .catch(err => console.log(err));
    
})

router.get('/', (req,res) =>{
    db.Institute.findAll({
        // where: {
        //     name: {[Op.not]: 'Cultural Council'}
        // }
    })
    .then(institutes => res.send(institutes))
    .catch(err => console.log(err));
})


router.delete('/:institute_id', [authJwt.verifyToken], (req, res) =>{
    db.Institute.destroy({
        where:{
            id: req.params.institute_id,
        }
    })
    .then(() => res.send("institute deleted"))
    .catch(err => console.log(err));
})

router.put('/:institute_id', [authJwt.verifyToken], (req,res) =>{

    db.Institute.update({
        name: req.body.name,
        contact: req.body.contact,
        address: req.body.address,
        description: req.body.description,
        },
        {
            where:{
                id: req.params.institute_id
            }
        }
    )
    .then(institute => res.send(institute))
    .catch(err => console.log(err));
})

router.post('/:institute_id', [authJwt.verifyToken], (req,res) =>{

    db.Institute.create({
        name: req.body.name,
        contact: req.body.contact,
        address: req.body.address,
        description: req.body.description,
        }
    )
    .then(institute => res.send(institute))
    .catch(err => console.log(err));
})

module.exports = router;

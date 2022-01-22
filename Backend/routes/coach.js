const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");


router.get('/:coach_id',(req,res) =>{
    
    db.Coach.findOne({where : {id: req.params.coach_id}})
    .then(coach =>{ res.send(coach)})
    .catch(err => console.log(err));
    
})

router.get('/', (req,res) =>{
    db.Coach.findAll({
        // where: {
        //     name: {[Op.not]: 'Cultural Council'}
        // }
    })
    .then(coaches => res.send(coaches))
    .catch(err => console.log(err));
})


router.delete('/:coach_id', [authJwt.verifyToken], (req, res) =>{
    db.Coach.destroy({
        where:{
            id: req.params.coach_id,
        }
    })
    .then(() => res.send("coach deleted"))
    .catch(err => console.log(err));
})

router.put('/:coach_id', [authJwt.verifyToken], (req,res) =>{

    db.Coach.update({
        name: req.body.name,
        contact: req.body.contact,
        address: req.body.address,
        description: req.body.description,
        },
        {
            where:{
                id: req.params.coach_id
            }
        }
    )
    .then(coach => res.send(coach))
    .catch(err => console.log(err));
})

router.post('/:coach_id', [authJwt.verifyToken], (req,res) =>{

    db.Coach.create({
        name: req.body.name,
        contact: req.body.contact,
        address: req.body.address,
        description: req.body.description,
        }
    )
    .then(coach => res.send(coach))
    .catch(err => console.log(err));
})

module.exports = router;

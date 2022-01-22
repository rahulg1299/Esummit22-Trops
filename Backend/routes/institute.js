const express = require('express');
const router = express.Router();
const db = require('../models');
const { Op } = require("sequelize");
const  {authJwt}  = require("../middleware");
const  {verifySignUp}  = require("../middleware");
const controller = require("../controller/auth.controller");
const { query } = require('express');


router.get('/:institute_id',(req,res) =>{
    
    db.Institute.findOne({where : {id: req.params.institute_id}})
    .then(institute =>{ res.send(institute)})
    .catch(err => console.log(err));
    
})

router.get('/', (req,res) =>{

    let query = {};
    if(req.query.address != undefined)
        query.where.address = req.query.address
    
    
    if(req.query.sportId != undefined)
        query.where.sportId = parseInt(req.query.sportId);

        
    db.Institute.findAll(query).then(instis => {

        let data = instis;
        let instiIds = data.map((e) => {
            return e.id;
        })

        if(req.query.sportId != undefined){
            Promise.all([
                db.InstituteSportMapping.findAll({ where : {id : {[Op.in] : instiIds} , sportId : req.query.sportId} , attributes: ['instituteId'] })
            ]).then(val => {
                data = data.filter((e) => {
                    return val[0].find(e.id) === true
                })
                res.send(data);
            })
        }
        else{
            res.send(data);
        }
    })
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

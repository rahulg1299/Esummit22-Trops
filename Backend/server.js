const express = require ('express')


const app = express();
const db = require('./models');
const cors = require('cors');
// const  {authJwt}  = require("./middleware");

const corsOptions ={
    origin:'http://localhost:3000', 
    credentials:true,            //access-control-allow-credentials:true
    optionSuccessStatus:200
}
app.use(cors(corsOptions));

const PORT =process.env.PORT || 9000;

// app.use(express.urlencoded({extended: true}));
// app.use(express.json());
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb'}));

app.use(function(req, res, next) {
    res.header(
        "Access-Control-Allow-Headers",
        "x-access-token, Origin, Content-Type, Accept"
    );
    next();
});


db.sequelize.sync().then(() => {
    app.listen(PORT, () =>{
      console.log('Server running at: ', PORT);
    })
})

// To Redefine the Db Schema Use This Segment
// db.sequelize.sync({force: true}).then(() => {
//     app.listen(PORT, () =>{
//       //console.log('Server running at: ', PORT);
//     })
// })

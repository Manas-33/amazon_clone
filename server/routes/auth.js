const express=require('express');
// const { findOne } = require('../models/user');
const bcryptjs=require('bcryptjs'); 
const User = require('../models/user');

const authRouter = express.Router();

authRouter.post('/api/signup', async(req,res)=>{
    try {
        //get  data from user then send it to database and return it to user

    const {name,email,password}=req.body;   //map is sent {'name':name,'email':email,'password':password}
    const existingUser=await User.findOne({email});

    if(existingUser){
        return res.status(400).json({msg:'User with same email already exists!'});
    }

    const hashedPassword=await bcryptjs.hash(password,8);

    let user=new User({
        email,
        password:hashedPassword,
        name
    });

    user=await user.save();
    res.json(user);
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});


module.exports=authRouter;
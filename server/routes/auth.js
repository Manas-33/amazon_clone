const express=require('express');
// const { findOne } = require('../models/user');
const jwt=require('jsonwebtoken');
const bcryptjs=require('bcryptjs'); 
const User = require('../models/user');
const auth = require('../middleware/auth');

const authRouter = express.Router();

//SIGN UP
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

//SIGN IN

authRouter.post('/api/signin', async(req,res)=>{
    try {
        const {email,password} =req.body;
        const user = await User.findOne({email});
        if(!user){
            return res.status(400).json({msg:"User with this email does not exist!"})
        }
        const isMatch= await bcryptjs.compare(password,user.password);
        if(!isMatch){
            return res.status(400).json({msg:"Incorrect Password!"});
        }
        const token =jwt.sign({id:user._id},"passwordKey");//"passwordKey"for 
        res.json({token,...user._doc});
        //{
        //'toke':'tokensomething' this will be created     
        //'name':'manas'
        //'email':'manas@m.com'
        //}
        
    } catch (e) {
        res.status(500).json({error:e.message});
    }
});

//Is token Valid api
authRouter.post('/tokenIsValid',async(req,res)=>{
    try {
        //first check whether the token exists
        const token =req.header('x-auth-token');
        if(!token) return res.json(false);
        //then verify the secret key using jwt
        const verified=jwt.verify(token,'passwordKey');
        if(!verified) return res.json(false);
        //then check whether the user exists
        const user=await User.findById(verified.id);
        if(!user) return res.json(false);
        //finally set to true
        res.json(true);
    } catch (error) {
        res.status(500).json({error:e.message});
    }
});

//Get user data api
authRouter.get('/',auth,async(req,res)=>{
    const user=await User.findById(req.user);
    res.json({...user._doc,token:req.token});
    //we use ... to decompose user 
});

module.exports=authRouter;
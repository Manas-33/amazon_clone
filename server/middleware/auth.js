const jwt =require("jsonwebtoken");

const auth=async(req,res,next)=>{
    try {
        const token =req.header('x-auth-token');
        if(!token) return res.staus(401).json({msg:'No auth token, Access Denied'});
        const verified =jwt.verify(token,'passwordKey');
        if(!verified) return res.status(401).json({msg:"Token verification failed, Authorization Denied"});
        
        //this middleware when added to api's can enable them to directly 
        //access the user's id in the req as req.user if all the validations are successful
        //same is the case for token 
        req.user=verified.id;
        req.token=token;
        next();
        //next is used for going to the next api route
    } catch (e) {
        res.status(500).json({error:e.message});
    }
}
module.exports=auth;
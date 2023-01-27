//Import from packages
const express=require('express');
const mongoose =require('mongoose');
//import from other files
const authRouter=require('./routes/auth');


//Init
const PORT =3000;
const app=express();
const DB="mongodb+srv://manas:manasdalvi@cluster0.rgc9sli.mongodb.net/?retryWrites=true&w=majority"
//middleware client--> server--> client
app.use(express.json());
app.use(authRouter);


mongoose.connect(DB).then(()=>{
    console.log("Connection is successful")
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT,"0.0.0.0",function(){
    console.log(`Connected at port ${PORT}`)
});
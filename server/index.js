console.log("Hello World")


const express=require('express');
//import


const PORT =3000;
//Creating an API
//GET PUT POST DELETE UPDATE => CRUD
const app=express();

app.listen(PORT,"0.0.0.0",function(){
    console.log(`Connected at port ${PORT}`)
});
//local host




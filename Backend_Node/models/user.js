const mongoose = require("mongoose")

const userSchema = new mongoose.Schema({
    name:{
        type:String,
        require:true,
        trim:true,
    },
    email:{
        type:String,
        require:true,
        trim:true,
        unique:true,
    },
    age:{
        type:Number,
        required:true
    }
},{timestamps:true}
);
const User = mongoose.model("User",userSchema)
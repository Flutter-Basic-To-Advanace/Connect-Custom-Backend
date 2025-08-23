const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const  cors = require("cors");
const userRoutes = require("./Routes/user")
dotenv.config();

const app = express();

//middleware
app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 5000;

//config routes
app.use("/api/user",userRoutes)

mongoose
    .connect(process.env.MONGODB_URI)
    .then(()=>console.log("MongoDB connected Sucessfully"))
    .catch((error)=>console.log("MongoDb Connection Error: ",error))

//start the server
app.listen(PORT,()=>{
    console.log(`Server is running on port ${PORT}`)
})
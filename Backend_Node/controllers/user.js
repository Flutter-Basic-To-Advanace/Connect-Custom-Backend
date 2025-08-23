const User = require("../models/user");

//create user
exports.createUser = async (req,res) => {
    try {
        const user = new User(req.body);

        //store the user in the database
        await user.save();
        res.status(201).json(user);
    } catch (error) {
        res.status(400).json({ error: error.message})
    }
}

exports.GetSingleUser = async (req,res) => {
    try {
      const userId = req.params.id.trim();
      const user = await User.findById(userId);
      
      if(!user){
        return res.status(404).json({ message : "User not found "})
      } else {
        res.json(user);
      }
    } catch (error) {
        res.status(400).json({ error : error.message });
    }
}

//Get All users
exports.getAllUsers = async (req,res) => {
    try {
        const users = await User.find();
        res.json(users)
    } catch (error) {
        res.status(400).json({ error : error.message})
    }
}

//update a user
exports.updateUser = async (req,res) => {
    try {
        const userId = req.params.id.trim();
        const user = await User.findByIdAndUpdate(userId,req.body,{
            new : true,
            runValidators:true
        });

        if(!user){
            return res.status(404).json({ message : "User not found" });
        }else {
            res.json(user);
        }
    } catch (error) {
        res.status(400).json({ error: error.message})
    }
}

//Delete a user
exports.deleteUser = async (req,res) => {
    try {
        const userId = req.params.id.trim();
        const user = await User.findByIdAndDelete(userId);

        if(!user){
            return res.status(404).json({ message : "User Not found "});
        } else{
            res.json({ message : "User deleted Sucessfully!"})
        }
    } catch (error) {
        res.status(400).json({ error: error.message})
    }
}
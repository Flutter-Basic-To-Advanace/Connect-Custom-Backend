const express  = require('express')
const router = express.Router();

const userController = require("../controllers/user")

router.post("/create",userController.createUser)
router.get("/getsingleuser/:id",userController.GetSingleUser)
router.get("/getAllUsers",userController.getAllUsers)
router.put("/update/:id",userController.updateUser)
router.delete("/Delete/:id",userController.deleteUser)
module.exports = router;
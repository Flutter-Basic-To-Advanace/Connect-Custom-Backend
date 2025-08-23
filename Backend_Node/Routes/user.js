const express  = require('express')
const router = express.Router();

const userController = require("../controllers/user")

router.post("/create",userController.createUser)
router.get("/getsingleuser/:id",userController.GetSingleUser)
router.get("/getAllUsers",userController.getAllUsers)
module.exports = router;
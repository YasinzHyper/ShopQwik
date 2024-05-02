const express = require("express");
const User = require("../models/user.js");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth.js");

const authRouter = express.Router();

// Sign Up
authRouter.post("/api/signup", async (req, res) => {
  // get data from client
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }
    const hashedPassword = await bcryptjs.hash(password, 8);
    var user = new User({
      email,
      password: hashedPassword,
      name,
    });
    //post that data in database
    //return the data to user
    user = await user.save();
    res.json(user);
  } catch (err) {
    // console.log(err);
    res.status(500).json({ error: err.message });
  }
});

// Sign In route
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });

    if (!user) {
      return res.status(400).json({ error: e.message });
    }
    const isMatch = bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Password!" });
    }
    const token = jwt.sign({ id: user.id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Sign In route
authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// get user data
authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...User._doc, token: req.token });
});

module.exports = authRouter;

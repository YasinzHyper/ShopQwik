// Package Imports
const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv").config();

//File Imports
const authRouter = require("./routes/auth.js");
const adminRouter = require("./routes/admin.js");
const productRouter = require("./routes/product.js");
const userRouter = require("./routes/user.js");

// Init
const PORT = process.env.PORT || 3000;
const app = express();
const DB = process.env.MONGO_URL;

// MiddleWare
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection SUccessfull");
  })
  .catch((e) => {
    console.log(e);
  });

//Creating an API
app.get("/", (req, res) => {
  res.json();
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port: ${PORT}`);
});

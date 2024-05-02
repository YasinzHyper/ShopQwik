const mongoose = require("mongoose");
const { productSchema } = require("./product");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    reuired: true,
    trim: true,
    validate: {
      validator: (value) => {
        // RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").test(value);
        const re = /^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$/;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    type: String,
    required: true,
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "Please enter a password with more than 6 letters!",
    },
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  cart: [
    {
      product: productSchema,
      quantity: {
        type: Number,
        required: true,
      }
    },
  ],
});

const User = mongoose.model("User", userSchema);
module.exports = User;

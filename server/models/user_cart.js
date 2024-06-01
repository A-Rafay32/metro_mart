const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userCartSchema = new Schema({
  quantity: {
    type: Number,
    required: true,
    default: 0,
  },
  products: {
    type: Array,
    required: true,
  },
});

const UserCart = mongoose.model("UserCart", userCartSchema);

module.exports = UserCart;

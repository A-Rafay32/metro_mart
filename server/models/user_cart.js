const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userCartSchema = new Schema({
  quantity: {
    type: Number,
    required: true,
    default: 0,
  },
  products: [
    {
      type: Schema.Types.ObjectId,
      ref: "Product",
    },
  ],
});

const UserCart = mongoose.model("UserCart", userCartSchema);

module.exports = UserCart;

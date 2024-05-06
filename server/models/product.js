const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const productQrCodeSchema = new Schema({
  scannedQty: {
    type: Number,
    default: 0,
  },
  qrCOde: {
    type: String,
    required: true,
  },
});

const productSchema = new Schema({
  id: {
    type: String,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  inventoryQty: {
    type: Number,
    required: true,
  },
  qrcode: productQrCodeSchema,
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;

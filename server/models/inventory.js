const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const inventorySchema = new Schema({
  id: {
    type: String,
    required: true,
  },
  ownerId: {
    type: String,
    required: true,
  },
  storeId: {
    type: String,
    required: true,
  },
  products: {
    type: Array,
    required: true,
  },
});

// Virtual property to calculate totalItems
inventorySchema.virtual("totalItems").get(function () {
  return this.products.length;
});

const Inventory = mongoose.model("Inventory", inventorySchema);

module.exports = Inventory;

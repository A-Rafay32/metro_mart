const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const storeSchema = new Schema({
  id: {
    type: String,
    required: true,
  },
  owner: {
    type: Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  inventory: {
    type: Schema.Types.ObjectId,
    ref: "Inventory",
    required: true,
  },
  branchCode: {
    type: Number,
    required: true,
  },
});

const Store = mongoose.model("Store", storeSchema);

module.exports = Store;

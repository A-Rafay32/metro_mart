const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const bankAccountSchema = new Schema({
  title: {
    type: String,
    required: true,
  },
  bankName: {
    type: String,
    required: true,
  },
  branchName: {
    type: String,
    required: true,
  },
  pin: {
    type: Number,
    required: true,
  },
});

const BankAccount = mongoose.model("BankAccount", bankAccountSchema);

module.exports = BankAccount;

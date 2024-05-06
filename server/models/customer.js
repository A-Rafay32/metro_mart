const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const customerSchema = new Schema({
  name: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    required: true,
  },
  password: {
    type: String,
    required: true,
  },
  phoneNum: {
    type: String,
    required: true,
  },
  cnic: {
    type: String,
    required: true,
  },
  userType: {
    type: String,
    required: true,
  },
  bankAccount: {
    type: Array,
    required: true,
  },
  userCart: {
    type: Array,
    required: true,
  },
});

const Customer = mongoose.model("Customer", customerSchema);
module.exports = Customer;

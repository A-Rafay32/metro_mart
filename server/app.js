const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth_router");

// constants
const PORT = 3000;
const DB =
  "mongodb+srv://abdulrafaychohan986:liRjUmSY0fwj1vXj@cluster0.5fvtqaq.mongodb.net";
const app = express();

//routes
app.use(express.json());
app.use("/auth", authRouter);

//connections
mongoose
  .connect(DB)
  .then(() => console.log("Connection Succesful"))
  .catch((e) => console.log(e));

app.listen(PORT, "0.0.0.0", () => {
  console.log("connected at port" + PORT);
});

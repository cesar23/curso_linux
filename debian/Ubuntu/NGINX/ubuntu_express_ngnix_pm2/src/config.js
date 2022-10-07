// import { config } from "dotenv";
const   config= require("dotenv");
config.config()



module.exports = {
  PORT: process.env.PORT || 5000,
  APPID: process.env.APPID || "",
};

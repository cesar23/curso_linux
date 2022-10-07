const  express =require("express");
const  path =require("path");
const  morgan =require("morgan");
const  routes =require("./routes/index");

const  config = require("./config.js");

const app = express();

// Settings
app.set("port", config.PORT);
app.set("views", path.resolve(__dirname, "views"));
app.set("view engine", "ejs");

// Middlewares
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));

// global variables
app.use((req, res, next) => {
  console.log(config.APPID)
  app.locals.APPID = config.APPID;
  next();
});

// Routes
app.use(routes);

app.use(express.static(path.join(__dirname, "public")));

// 404 handler
app.use((req, res, next) => {
  res.status(404).render("404");
});
module.exports = app;
// export default app;

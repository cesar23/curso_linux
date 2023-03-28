const app = require("../app");


const  { Router } =require("express");

const {
  renderAboutPage,
  renderIndexPage,
  renderNewEntryPage,
  createNewEntry,
  deleteBook,
} =require ("../controllers/index.controller.js");

const router = Router();

router.get("/", renderIndexPage);

router.get("/about", renderAboutPage);

router.get("/new-entry", renderNewEntryPage);

router.post("/new-entry", createNewEntry);

router.get("/delete/:id", deleteBook);

// export canvas.cesar.com.conf router;
module.exports = router;

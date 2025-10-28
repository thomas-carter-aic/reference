import express from "express";

const app = express();
const port = process.env.PORT || 3001;

app.get("/", (req, res) => {
  res.json({ message: "Hello from Node.js Service!" });
});

app.listen(port, () => {
  console.log(`🚀 Node.js service running on port ${port}`);
});

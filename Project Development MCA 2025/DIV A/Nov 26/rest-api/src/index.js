import app from "./app.js";
import mongoose from "mongoose";

mongoose.connect("mongodb+srv://root:root@cluster0.d0drjfy.mongodb.net/?appName=Cluster0")
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((err) => {
    console.log("Error connecting to MongoDB", err);
  });

// Start server
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

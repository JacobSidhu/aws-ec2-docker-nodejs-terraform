const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req,res)=> {
    res.json({
        message : "Hello from a Dockerised Node.js application on AWS EC2.",
        project: "aws-ec2-docker-nodejs-terraform",
        status: "running",
        platform: "AWS EC2",
        runtime : "Docker + Node.js + Express"
    });
});


app.get("/health", (req, res) => {
  res.status(200).json({
    status: "healthy",
    service: "nodejs-cloud-app",
    timestamp: new Date().toISOString()
  });
});


app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});
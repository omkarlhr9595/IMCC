// Centralized error handling middleware
export const errorHandler = (err, req, res, next) => {
  console.error(err.stack);
  
  // Mongoose validation error
  if (err.name === "ValidationError") {
    return res.status(400).json({ error: err.message });
  }
  
  // Mongoose duplicate key error
  if (err.code === 11000) {
    return res.status(400).json({ error: "Duplicate entry" });
  }
  
  // Default server error
  res.status(err.status || 500).json({
    error: err.message || "Internal Server Error"
  });
};

// 404 Not Found handler
export const notFound = (req, res) => {
  res.status(404).json({ error: "Route not found" });
};
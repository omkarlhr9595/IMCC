import dotenv from "dotenv";

// Load environment variables from .env file
dotenv.config();

const config = {
  // Server Configuration
  port: process.env.PORT || 3000,
  nodeEnv: process.env.NODE_ENV || "development",

  // JWT Configuration
  jwtSecret:
    process.env.JWT_SECRET || "your-secret-key-change-this-in-production",
  jwtExpiresIn: process.env.JWT_EXPIRES_IN || "7d",
  jwtIssuer: process.env.JWT_ISSUER || "rest-api",
  jwtAudience: process.env.JWT_AUDIENCE || "rest-api-users",

  // Database Configuration
  mongoUri:
    process.env.MONGO_URI ||
    "mongodb+srv://root:root@cluster0.d0drjfy.mongodb.net/?appName=Cluster0",

  // Validate required environment variables
  validate: () => {
    const required = ["JWT_SECRET"];
    const missing = required.filter((key) => !process.env[key]);

    if (missing.length > 0 && config.nodeEnv === "production") {
      throw new Error(
        `Missing required environment variables: ${missing.join(", ")}`
      );
    }
  },
};

// Validate configuration on load (only in production)
if (config.nodeEnv === "production") {
  config.validate();
}

export default config;

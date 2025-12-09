import dotenv from "dotenv";

// Load environment variables from .env file
dotenv.config();

const config = {
  // Server Configuration
  port: process.env.PORT,
  nodeEnv: process.env.NODE_ENV,

  // JWT Configuration
  jwtSecret:
    process.env.JWT_SECRET,
  jwtExpiresIn: process.env.JWT_EXPIRES_IN,
  jwtIssuer: process.env.JWT_ISSUER,
  jwtAudience: process.env.JWT_AUDIENCE,

  // Database Configuration
  mongoUri: process.env.MONGO_URI,

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

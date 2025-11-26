import jwt from "jsonwebtoken";
import config from "../config/index.js";

/**
 * Generate a JWT token for a user
 * @param {Object} payload - The data to encode in the token (usually user ID and other info)
 * @param {string} expiresIn - Token expiration time (e.g., '1h', '7d', '30d')
 * @returns {string} JWT token
 */
export const generateToken = (payload, expiresIn = config.jwtExpiresIn) => {
  try {
    const token = jwt.sign(payload, config.jwtSecret, {
      expiresIn: expiresIn,
      issuer: config.jwtIssuer,
      audience: config.jwtAudience,
    });
    return token;
  } catch (error) {
    throw new Error(`Error generating token: ${error.message}`);
  }
};

/**
 * Verify and decode a JWT token
 * @param {string} token - The JWT token to verify
 * @returns {Object} Decoded token payload
 */
export const verifyToken = (token) => {
  try {
    const decoded = jwt.verify(token, config.jwtSecret);
    return decoded;
  } catch (error) {
    if (error.name === "TokenExpiredError") {
      throw new Error("Token has expired");
    } else if (error.name === "JsonWebTokenError") {
      throw new Error("Invalid token");
    } else {
      throw new Error(`Token verification failed: ${error.message}`);
    }
  }
};

/**
 * Decode a JWT token without verification (use with caution)
 * @param {string} token - The JWT token to decode
 * @returns {Object} Decoded token payload
 */
export const decodeToken = (token) => {
  try {
    return jwt.decode(token);
  } catch (error) {
    throw new Error(`Error decoding token: ${error.message}`);
  }
};

/**
 * Middleware to verify JWT token from Authorization header
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object
 * @param {Function} next - Express next middleware function
 */
export const authenticateToken = (req, res, next) => {
  try {
    // Get token from Authorization header
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1]; // Format: "Bearer TOKEN"

    if (!token) {
      return res.status(401).json({ error: "Access token required" });
    }

    // Verify token
    const decoded = verifyToken(token);
    req.user = decoded; // Attach decoded user info to request object
    next();
  } catch (error) {
    return res.status(403).json({ error: error.message });
  }
};

export default {
  generateToken,
  verifyToken,
  decodeToken,
  authenticateToken,
};

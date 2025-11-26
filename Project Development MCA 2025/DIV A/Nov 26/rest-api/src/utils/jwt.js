import jwt from "jsonwebtoken";

// JWT Secret - In production, use environment variables
const JWT_SECRET = process.env.JWT_SECRET || "your-secret-key-change-this-in-production";
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || "7d"; // Default: 7 days

/**
 * Generate a JWT token for a user
 * @param {Object} payload - The data to encode in the token (usually user ID and other info)
 * @param {string} expiresIn - Token expiration time (e.g., '1h', '7d', '30d')
 * @returns {string} JWT token
 */
export const generateToken = (payload, expiresIn = JWT_EXPIRES_IN) => {
  try {
    const token = jwt.sign(
      payload,
      JWT_SECRET,
      {
        expiresIn: expiresIn,
        issuer: "rest-api", // Optional: identifies who issued the token
        audience: "rest-api-users" // Optional: identifies who the token is intended for
      }
    );
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
    const decoded = jwt.verify(token, JWT_SECRET);
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
  authenticateToken
};


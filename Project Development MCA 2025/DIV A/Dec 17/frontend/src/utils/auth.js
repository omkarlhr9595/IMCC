/**
 * Token validation helper function
 * Checks if token exists in localStorage and validates expiration date
 * @returns {Object} { isValid: boolean, token: string|null, decoded: Object|null }
 */
export const validateToken = () => {
  try {
    // Get token from localStorage
    const token = localStorage.getItem('token');
    
    if (!token) {
      return {
        isValid: false,
        token: null,
        decoded: null,
        error: 'No token found'
      };
    }

    // Decode token to check expiration (without verification)
    // JWT tokens have 3 parts: header.payload.signature
    const parts = token.split('.');
    if (parts.length !== 3) {
      return {
        isValid: false,
        token: null,
        decoded: null,
        error: 'Invalid token format'
      };
    }

    // Decode payload (second part)
    const payload = JSON.parse(atob(parts[1]));
    
    // Check if token has expiration
    if (!payload.exp) {
      return {
        isValid: false,
        token: null,
        decoded: null,
        error: 'Token has no expiration date'
      };
    }

    // Check if token is expired
    const currentTime = Math.floor(Date.now() / 1000); // Current time in seconds
    if (payload.exp < currentTime) {
      // Token is expired, remove it from localStorage
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      return {
        isValid: false,
        token: null,
        decoded: null,
        error: 'Token has expired'
      };
    }

    // Token is valid
    return {
      isValid: true,
      token: token,
      decoded: payload,
      error: null
    };
  } catch (error) {
    // If there's any error parsing the token, remove it
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    return {
      isValid: false,
      token: null,
      decoded: null,
      error: error.message || 'Error validating token'
    };
  }
};

/**
 * Check if user is authenticated
 * Redirects to login if token is invalid
 * Use this on pages that require authentication (except login/register)
 */
export const requireAuth = () => {
  const validation = validateToken();
  
  if (!validation.isValid) {
    // Redirect to login page
    window.location.hash = '#/login';
    return false;
  }
  
  return true;
};

/**
 * Get stored user data
 */
export const getStoredUser = () => {
  try {
    const userStr = localStorage.getItem('user');
    return userStr ? JSON.parse(userStr) : null;
  } catch (error) {
    return null;
  }
};

/**
 * Store token and user data
 */
export const storeAuthData = (token, user) => {
  localStorage.setItem('token', token);
  localStorage.setItem('user', JSON.stringify(user));
};

/**
 * Clear authentication data
 */
export const clearAuthData = () => {
  localStorage.removeItem('token');
  localStorage.removeItem('user');
};


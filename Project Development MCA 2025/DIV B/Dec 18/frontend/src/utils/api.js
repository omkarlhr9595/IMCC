// API base URL - adjust this to match your backend server
const API_BASE_URL = 'http://localhost:3000/api'; // Change port if needed

/**
 * Make API request with authentication
 */
export const apiRequest = async (endpoint, options = {}) => {
  const token = localStorage.getItem('token');
  
  const headers = {
    'Content-Type': 'application/json',
    ...options.headers,
  };

  // Add authorization header if token exists
  if (token) {
    headers['Authorization'] = `Bearer ${token}`;
  }

  const config = {
    ...options,
    headers,
  };

  try {
    const response = await fetch(`${API_BASE_URL}${endpoint}`, config);
    const data = await response.json();
    
    if (!response.ok) {
      throw new Error(data.error || 'Request failed');
    }
    
    return data;
  } catch (error) {
    throw error;
  }
};

/**
 * Register user
 */
export const registerUser = async (userData) => {
  return apiRequest('/users/register', {
    method: 'POST',
    body: JSON.stringify(userData),
  });
};

/**
 * Login user
 */
export const loginUser = async (email, password) => {
  return apiRequest('/users/login', {
    method: 'POST',
    body: JSON.stringify({ email, password }),
  });
};

/**
 * Get all notes
 */
export const getAllNotes = async () => {
  try {
    return await apiRequest('/notes', {
      method: 'GET',
    });
  } catch (error) {
    // If no notes found, return empty array instead of throwing
    if (error.message.includes('No notes found')) {
      return [];
    }
    throw error;
  }
};

/**
 * Create a new note
 */
export const createNote = async (title, content, userId) => {
  return apiRequest('/notes', {
    method: 'POST',
    body: JSON.stringify({ title, content, userId }),
  });
};

/**
 * Update a note
 */
export const updateNote = async (noteId, title, content) => {
  return apiRequest(`/notes/${noteId}`, {
    method: 'PUT',
    body: JSON.stringify({ title, content }),
  });
};

/**
 * Delete a note
 */
export const deleteNote = async (noteId) => {
  return apiRequest(`/notes/${noteId}`, {
    method: 'DELETE',
  });
};


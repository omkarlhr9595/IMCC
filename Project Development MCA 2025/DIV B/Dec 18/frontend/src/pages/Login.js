import { loginUser } from '../utils/api.js';
import { storeAuthData, validateToken } from '../utils/auth.js';

export const renderLogin = () => {
  // Check if already logged in
  const tokenValidation = validateToken();
  if (tokenValidation.isValid) {
    window.location.hash = '#/home';
    return;
  }

  return `
    <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100 px-4">
      <div class="max-w-md w-full bg-white rounded-lg shadow-xl p-8">
        <div class="text-center mb-8">
          <h1 class="text-3xl font-bold text-gray-800 mb-2">Welcome Back</h1>
          <p class="text-gray-600">Sign in to your account</p>
        </div>
        
        <form id="loginForm" class="space-y-6">
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
              Email Address
            </label>
            <input
              type="email"
              id="email"
              name="email"
              required
              class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent outline-none transition"
              placeholder="you@example.com"
            />
          </div>
          
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700 mb-2">
              Password
            </label>
            <input
              type="password"
              id="password"
              name="password"
              required
              class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-transparent outline-none transition"
              placeholder="Enter your password"
            />
          </div>
          
          <div id="errorMessage" class="hidden bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg"></div>
          
          <button
            type="submit"
            id="loginButton"
            class="w-full bg-indigo-600 text-white py-3 rounded-lg font-semibold hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition disabled:opacity-50 disabled:cursor-not-allowed"
          >
            Sign In
          </button>
        </form>
        
        <div class="mt-6 text-center">
          <p class="text-gray-600">
            Don't have an account?
            <a href="#/register" class="text-indigo-600 hover:text-indigo-700 font-semibold">
              Sign up
            </a>
          </p>
        </div>
      </div>
    </div>
  `;
};

export const initLogin = () => {
  const form = document.getElementById('loginForm');
  const errorMessage = document.getElementById('errorMessage');
  const loginButton = document.getElementById('loginButton');

  if (!form) return;

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    
    // Reset error message
    errorMessage.classList.add('hidden');
    loginButton.disabled = true;
    loginButton.textContent = 'Signing in...';

    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;

    try {
      const response = await loginUser(email, password);
      
      // Store token and user data
      storeAuthData(response.token, response.user);
      
      // Redirect to home page
      window.location.hash = '#/home';
    } catch (error) {
      errorMessage.textContent = error.message || 'Login failed. Please try again.';
      errorMessage.classList.remove('hidden');
      loginButton.disabled = false;
      loginButton.textContent = 'Sign In';
    }
  });
};


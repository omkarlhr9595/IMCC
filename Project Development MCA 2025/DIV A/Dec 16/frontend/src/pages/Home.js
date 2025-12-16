import { getStoredUser, clearAuthData, requireAuth } from '../utils/auth.js';

export const renderHome = () => {
  // Validate token and redirect to login if invalid
  if (!requireAuth()) {
    return '';
  }
  
  const user = getStoredUser();

  return `
    <div class="min-h-screen bg-gradient-to-br from-green-50 to-teal-100">
      <nav class="bg-white shadow-sm border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex justify-between items-center h-16">
            <div class="flex items-center">
              <h1 class="text-2xl font-bold text-gray-800">My App</h1>
            </div>
            <div class="flex items-center space-x-4">
              <span class="text-gray-700">Welcome, <span class="font-semibold">${user.firstName} ${user.lastName}</span></span>
              <button
                id="logoutButton"
                class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2 transition"
              >
                Logout
              </button>
            </div>
          </div>
        </div>
      </nav>
      
      <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="bg-white rounded-lg shadow-xl p-8">
          <h2 class="text-3xl font-bold text-gray-800 mb-6">Dashboard</h2>
          
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
            <div class="bg-gradient-to-br from-blue-500 to-blue-600 rounded-lg p-6 text-white">
              <h3 class="text-lg font-semibold mb-2">Profile</h3>
              <p class="text-blue-100">View and edit your profile information</p>
            </div>
            
            <div class="bg-gradient-to-br from-purple-500 to-purple-600 rounded-lg p-6 text-white">
              <h3 class="text-lg font-semibold mb-2">Settings</h3>
              <p class="text-purple-100">Manage your account settings</p>
            </div>
            
            <div class="bg-gradient-to-br from-green-500 to-green-600 rounded-lg p-6 text-white">
              <h3 class="text-lg font-semibold mb-2">Notes</h3>
              <p class="text-green-100">Create and manage your notes</p>
            </div>
          </div>
          
          <div class="bg-gray-50 rounded-lg p-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">User Information</h3>
            <div class="space-y-2">
              <p class="text-gray-700"><span class="font-semibold">Username:</span> ${user.username}</p>
              <p class="text-gray-700"><span class="font-semibold">Email:</span> ${user.email}</p>
              <p class="text-gray-700"><span class="font-semibold">Name:</span> ${user.firstName} ${user.lastName}</p>
            </div>
          </div>
        </div>
      </main>
    </div>
  `;
};

export const initHome = () => {
  const logoutButton = document.getElementById('logoutButton');
  
  if (logoutButton) {
    logoutButton.addEventListener('click', () => {
      clearAuthData();
      window.location.hash = '#/login';
    });
  }
};


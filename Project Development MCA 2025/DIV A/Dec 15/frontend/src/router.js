import { renderLogin, initLogin } from './pages/Login.js';
import { renderRegister, initRegister } from './pages/Register.js';
import { renderHome, initHome } from './pages/Home.js';
import { requireAuth, validateToken } from './utils/auth.js';

const routes = {
  '/login': {
    render: renderLogin,
    init: initLogin,
    requiresAuth: false,
  },
  '/register': {
    render: renderRegister,
    init: initRegister,
    requiresAuth: false,
  },
  '/home': {
    render: renderHome,
    init: initHome,
    requiresAuth: true,
  },
};

/**
 * Get current route from hash
 */
const getCurrentRoute = () => {
  const hash = window.location.hash.slice(1);
  // If no hash or just '#', default to login
  if (!hash || hash === '/') {
    return '/login';
  }
  return hash;
};

/**
 * Render the current route
 */
export const renderRoute = () => {
  const route = getCurrentRoute();
  const routeConfig = routes[route];

  // If route doesn't exist, redirect to login
  if (!routeConfig) {
    window.location.hash = '#/login';
    return;
  }

  // Check authentication for protected routes
  if (routeConfig.requiresAuth) {
    const isValid = requireAuth();
    if (!isValid) {
      return; // requireAuth already redirects to login
    }
  } else {
    // For login/register pages, redirect to home if already authenticated
    const validation = validateToken();
    if (validation.isValid) {
      window.location.hash = '#/home';
      return;
    }
  }

  // Render the page
  const app = document.getElementById('app');
  if (app) {
    app.innerHTML = routeConfig.render();
    
    // Initialize the page after a short delay to ensure DOM is ready
    setTimeout(() => {
      if (routeConfig.init) {
        routeConfig.init();
      }
    }, 0);
  }
};

/**
 * Initialize router
 */
export const initRouter = () => {
  // Render initial route
  renderRoute();

  // Listen for hash changes
  window.addEventListener('hashchange', renderRoute);
};


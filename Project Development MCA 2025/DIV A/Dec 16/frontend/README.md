# Frontend Application

## Features

- **Login Page**: User authentication with email and password
- **Register Page**: New user registration with validation
- **Home Page**: Protected dashboard page (requires authentication)
- **Token Management**: Automatic token storage and validation
- **Authentication Helper**: Token validation function for protected pages

## Setup

1. Install dependencies:
```bash
npm install
```

2. Configure API URL:
   - Open `src/utils/api.js`
   - Update `API_BASE_URL` to match your backend server (default: `http://localhost:3000/api`)

3. Start development server:
```bash
npm run dev
```

## Usage

### Authentication Helper

The `validateToken()` function in `src/utils/auth.js` can be used on any page (except login/register) to check if a token exists and is valid:

```javascript
import { validateToken, requireAuth } from './utils/auth.js';

// Check token validity
const validation = validateToken();
if (validation.isValid) {
  // Token is valid, user is authenticated
  console.log('User:', validation.decoded);
} else {
  // Token is invalid or expired
  console.log('Error:', validation.error);
}

// Or use requireAuth() which automatically redirects to login if invalid
requireAuth(); // Returns false and redirects if not authenticated
```

### Routes

- `#/login` - Login page
- `#/register` - Registration page
- `#/home` - Home/Dashboard page (protected)

## Token Storage

- Tokens are stored in `localStorage` as `token`
- User data is stored in `localStorage` as `user`
- Tokens are automatically validated for expiration
- Expired tokens are automatically removed


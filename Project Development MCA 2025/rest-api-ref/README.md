# Social Media REST API

A basic REST API for a social media app using Express.js and MongoDB.

## Project Structure

```
rest-api-ref/
├── .env
├── .gitignore
├── package.json
├── README.md
└── src/
    ├── index.js          # Server entry point
    ├── app.js            # Express app configuration
    ├── models/
    │   ├── User.js       # User model
    │   └── Post.js       # Post model
    ├── controllers/
    │   ├── userController.js  # User business logic
    │   └── postController.js  # Post business logic
    ├── routes/
    │   ├── users.js      # User routes
    │   └── posts.js      # Post routes
    └── middleware/
        ├── errorHandler.js   # Error handling
        └── validator.js      # Request validation
```

## Features

- **Users**: Create, read, update, and delete users
- **Posts**: Create, read, update, and delete posts
- **Likes**: Like/unlike posts
- **Comments**: Add comments to posts
- **Modular Structure**: Separated concerns with controllers, routes, and middleware

## Setup

1. Install dependencies:
```bash
npm install
```

2. Make sure MongoDB is running on your local machine or update the connection string in `.env`

3. Start the server:
```bash
npm start
```

For development with auto-reload:
```bash
npm run dev
```

## API Endpoints

### Users

- `GET /api/users` - Get all users
- `GET /api/users/:id` - Get user by ID
- `POST /api/users` - Create a new user
- `PUT /api/users/:id` - Update user
- `DELETE /api/users/:id` - Delete user

### Posts

- `GET /api/posts` - Get all posts
- `GET /api/posts/:id` - Get post by ID
- `POST /api/posts` - Create a new post
- `PUT /api/posts/:id` - Update post
- `DELETE /api/posts/:id` - Delete post
- `POST /api/posts/:id/like` - Like/unlike a post
- `POST /api/posts/:id/comment` - Add a comment to a post

## Example Requests

### Create a user
```json
POST /api/users
{
  "username": "johndoe",
  "email": "john@example.com",
  "firstName": "John",
  "lastName": "Doe"
}
```

### Create a post
```json
POST /api/posts
{
  "content": "This is my first post!",
  "author": "USER_ID_HERE"
}
```

### Like a post
```json
POST /api/posts/POST_ID/like
{
  "userId": "USER_ID_HERE"
}
```

### Comment on a post
```json
POST /api/posts/POST_ID/comment
{
  "userId": "USER_ID_HERE",
  "text": "Great post!"
}
```

## Architecture

- **ES6 Modules**: Using modern import/export syntax instead of CommonJS require
- **Separation of Concerns**: Controllers handle business logic, routes define endpoints, middleware handles validation and errors
- **Module Structure**: Clean separation between server setup (index.js) and app configuration (app.js)
- **Error Handling**: Centralized error handling middleware
- **Validation**: Request validation middleware for data integrity

## Environment Variables

- `PORT` - Server port (default: 3000)
- `MONGODB_URI` - MongoDB connection string

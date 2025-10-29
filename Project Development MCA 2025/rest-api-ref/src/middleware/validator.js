// Validation middleware
export const validateUser = (req, res, next) => {
  const { username, email } = req.body;
  
  if (!username || !email) {
    return res.status(400).json({ 
      error: "Username and email are required" 
    });
  }
  
  // Basic email validation
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: "Invalid email format" });
  }
  
  next();
};

export const validatePost = (req, res, next) => {
  const { content, author } = req.body;
  
  if (!content || !author) {
    return res.status(400).json({ 
      error: "Content and author are required" 
    });
  }
  
  if (content.trim().length === 0) {
    return res.status(400).json({ 
      error: "Post content cannot be empty" 
    });
  }
  
  next();
};
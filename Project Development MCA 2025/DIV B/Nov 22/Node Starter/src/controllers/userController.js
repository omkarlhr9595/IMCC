import User from "../models/User.js";

// Get all users
export const getAllUsers = async (req, res) => {
  try {
    const users = await User.find().sort({ createdAt: -1 });
    if (users.length === 0) {
      return res.status(404).json({ error: "No users found" });
    }
    return res.json(users);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get user by ID
export const getUserById = async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }
    return res.json(user);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

// Create a new user
export const createUser = async (req, res) => {
  try {
    const { username, email, firstName, lastName, password } = req.body;
    const user = new User({ username, email, firstName, lastName, password });
    await user.save();
    return res.status(201).json(user);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

// Update a user
export const updateUser = async (req, res) => {
  try {
    const { username, email, firstName, lastName, password } = req.body;
    const user = await User.findByIdAndUpdate(
      req.params.id,
      { username, email, firstName, lastName, password },
      { new: true }
    );
    return res.json(user);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

// Delete a user
export const deleteUser = async (req, res) => {
  try {
    await User.findByIdAndDelete(req.params.id);
    res.json({ message: "User deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

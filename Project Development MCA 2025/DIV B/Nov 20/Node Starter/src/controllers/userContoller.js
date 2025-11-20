import User from "../models/User.js";

// Get all users
export const getAllUsers = async (req, res) => {
    try {
        const users = await User.find().sort({ createdAt: -1 });
        if (users.length === 0) {
            return res.status(404).json({ error: "No users found" });
        }
        res.json(users);
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
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

// Create a new user
export const createUser = async (req, res) => {
    try {
        const { username, email, firstName, lastName, password } = req.body;
        const user = new User({ username, email, firstName, lastName, password });
        await user.save();
        res.status(201).json(user);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};
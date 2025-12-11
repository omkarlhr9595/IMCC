import Note from "../models/Notes.js";

// Create a new note
export const createNote = async (req, res) => {
  try {
    const { title, content, userId } = req.body;
    const note = new Note({ title, content, userId });
    await note.save();
    res.status(201).json({ message: "Note created successfully", note });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all notes
export const getAllNotes = async (req, res) => {
  try {
    const notes = await Note.find().sort({ createdAt: -1 });
    if (notes.length === 0) {
      return res.status(404).json({ error: "No notes found" });
    }
    res.json(notes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get a note by id
export const getNoteById = async (req, res) => {
  try {
    const note = await Note.findById(req.params.id);
    if (!note) {
      return res.status(404).json({ error: "Note not found" });
    }
    res.json(note);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Update a note
export const updateNote = async (req, res) => {
  try {
    const { title, content } = req.body;
    const note = await Note.findByIdAndUpdate(
      req.params.id,
      { title, content },
      { new: true }
    );
    if (!note) {
      return res.status(404).json({ error: "Note not found" });
    }
    res.json(note);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Delete a note
export const deleteNote = async (req, res) => {
  try {
    await Note.findByIdAndDelete(req.params.id);
    res.json({ message: "Note deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

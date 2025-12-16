import { getStoredUser, clearAuthData, requireAuth, validateToken } from '../utils/auth.js';
import { getAllNotes, createNote, updateNote, deleteNote } from '../utils/api.js';

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
              <h1 class="text-2xl font-bold text-gray-800">My Notes</h1>
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
        <div class="flex justify-between items-center mb-6">
          <h2 class="text-3xl font-bold text-gray-800">My Notes</h2>
          <button
            id="createNoteButton"
            class="bg-green-500 text-white px-6 py-3 rounded-lg hover:bg-green-600 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 transition font-semibold"
          >
            + Create Note
          </button>
        </div>

        <div id="notesContainer" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div class="col-span-full text-center py-12">
            <div class="inline-block animate-spin rounded-full h-12 w-12 border-b-2 border-green-500"></div>
            <p class="mt-4 text-gray-600">Loading notes...</p>
          </div>
        </div>
      </main>

      <!-- Note Modal -->
      <div id="noteModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
        <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
          <div class="p-6">
            <div class="flex justify-between items-center mb-4">
              <h3 id="modalTitle" class="text-2xl font-bold text-gray-800">Create Note</h3>
              <button
                id="closeModalButton"
                class="text-gray-500 hover:text-gray-700 text-2xl font-bold"
              >
                ×
              </button>
            </div>
            
            <form id="noteForm" class="space-y-4">
              <div>
                <label for="noteTitle" class="block text-sm font-medium text-gray-700 mb-2">
                  Title
                </label>
                <input
                  type="text"
                  id="noteTitle"
                  required
                  class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent outline-none transition"
                  placeholder="Enter note title"
                />
              </div>
              
              <div>
                <label for="noteContent" class="block text-sm font-medium text-gray-700 mb-2">
                  Content
                </label>
                <textarea
                  id="noteContent"
                  required
                  rows="10"
                  class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-500 focus:border-transparent outline-none transition resize-none"
                  placeholder="Enter note content"
                ></textarea>
              </div>
              
              <div id="modalErrorMessage" class="hidden bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg"></div>
              
              <div class="flex justify-end space-x-3 pt-4">
                <button
                  type="button"
                  id="cancelButton"
                  class="px-6 py-2 border border-gray-300 rounded-lg text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  id="saveNoteButton"
                  class="px-6 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 transition font-semibold"
                >
                  Save Note
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  `;
};

export const initHome = async () => {
  const logoutButton = document.getElementById('logoutButton');
  const createNoteButton = document.getElementById('createNoteButton');
  const noteModal = document.getElementById('noteModal');
  const closeModalButton = document.getElementById('closeModalButton');
  const cancelButton = document.getElementById('cancelButton');
  const noteForm = document.getElementById('noteForm');
  const notesContainer = document.getElementById('notesContainer');
  const modalTitle = document.getElementById('modalTitle');
  const modalErrorMessage = document.getElementById('modalErrorMessage');
  const saveNoteButton = document.getElementById('saveNoteButton');
  
  let currentNoteId = null;
  let notes = [];

  // Logout handler
  if (logoutButton) {
    logoutButton.addEventListener('click', () => {
      clearAuthData();
      window.location.hash = '#/login';
    });
  }

  // Load and display notes
  const loadNotes = async () => {
    try {
      const allNotes = await getAllNotes();
      const user = getStoredUser();
      // Filter notes to show only current user's notes
      notes = allNotes.filter(note => note.userId === user.id || note.userId?._id === user.id || note.userId?.toString() === user.id?.toString());
      renderNotes();
    } catch (error) {
      notesContainer.innerHTML = `
        <div class="col-span-full text-center py-12">
          <p class="text-red-600 mb-4">Error loading notes: ${error.message}</p>
          <button
            onclick="location.reload()"
            class="bg-green-500 text-white px-6 py-2 rounded-lg hover:bg-green-600 transition"
          >
            Retry
          </button>
        </div>
      `;
    }
  };

  // Render notes in the grid
  const renderNotes = () => {
    if (notes.length === 0) {
      notesContainer.innerHTML = `
        <div class="col-span-full text-center py-12">
          <div class="text-gray-400 mb-4">
            <svg class="mx-auto h-24 w-24" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
            </svg>
          </div>
          <p class="text-gray-600 text-lg mb-2">No notes yet</p>
          <p class="text-gray-500">Create your first note to get started!</p>
        </div>
      `;
      return;
    }

    notesContainer.innerHTML = notes.map(note => {
      const date = new Date(note.createdAt).toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'short',
        day: 'numeric'
      });
      const contentPreview = note.content.length > 150 
        ? note.content.substring(0, 150) + '...' 
        : note.content;

      return `
        <div class="bg-white rounded-lg shadow-md hover:shadow-xl transition-shadow p-6 flex flex-col">
          <div class="flex-1">
            <h3 class="text-xl font-bold text-gray-800 mb-2">${escapeHtml(note.title)}</h3>
            <p class="text-gray-600 mb-4 line-clamp-4">${escapeHtml(contentPreview)}</p>
            <p class="text-sm text-gray-400 mb-4">Created: ${date}</p>
          </div>
          <div class="flex space-x-2 pt-4 border-t border-gray-200">
            <button
              data-note-id="${note._id}"
              class="edit-note-button flex-1 bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition text-sm font-semibold"
            >
              Edit
            </button>
            <button
              data-note-id="${note._id}"
              class="delete-note-button flex-1 bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2 transition text-sm font-semibold"
            >
              Delete
            </button>
          </div>
        </div>
      `;
    }).join('');

    // Attach event listeners to edit and delete buttons
    document.querySelectorAll('.edit-note-button').forEach(button => {
      button.addEventListener('click', (e) => {
        const noteId = e.target.getAttribute('data-note-id');
        const note = notes.find(n => n._id === noteId);
        if (note) {
          openModal(note);
        }
      });
    });

    document.querySelectorAll('.delete-note-button').forEach(button => {
      button.addEventListener('click', async (e) => {
        const noteId = e.target.getAttribute('data-note-id');
        if (confirm('Are you sure you want to delete this note? This action cannot be undone.')) {
          await handleDeleteNote(noteId);
        }
      });
    });
  };

  // Open modal for create or edit
  const openModal = (note = null) => {
    currentNoteId = note ? note._id : null;
    modalTitle.textContent = note ? 'Edit Note' : 'Create Note';
    document.getElementById('noteTitle').value = note ? note.title : '';
    document.getElementById('noteContent').value = note ? note.content : '';
    modalErrorMessage.classList.add('hidden');
    noteModal.classList.remove('hidden');
  };

  // Close modal
  const closeModal = () => {
    noteModal.classList.add('hidden');
    currentNoteId = null;
    noteForm.reset();
    modalErrorMessage.classList.add('hidden');
  };

  // Handle delete note
  const handleDeleteNote = async (noteId) => {
    try {
      await deleteNote(noteId);
      notes = notes.filter(n => n._id !== noteId);
      renderNotes();
    } catch (error) {
      alert(`Error deleting note: ${error.message}`);
    }
  };

  // Handle form submission
  if (noteForm) {
    noteForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      modalErrorMessage.classList.add('hidden');
      
      const title = document.getElementById('noteTitle').value.trim();
      const content = document.getElementById('noteContent').value.trim();
      const user = getStoredUser();

      if (!title || !content) {
        modalErrorMessage.textContent = 'Please fill in all fields';
        modalErrorMessage.classList.remove('hidden');
        return;
      }

      // Get userId from token (more reliable) or from user object
      const tokenValidation = validateToken();
      let userId = null;
      
      if (tokenValidation.isValid && tokenValidation.decoded && tokenValidation.decoded.userId) {
        userId = tokenValidation.decoded.userId;
      } else if (user && user.id) {
        userId = user.id.toString ? user.id.toString() : String(user.id);
      }

      if (!userId) {
        modalErrorMessage.textContent = 'User information not found. Please login again.';
        modalErrorMessage.classList.remove('hidden');
        return;
      }

      saveNoteButton.disabled = true;
      saveNoteButton.textContent = 'Saving...';

      try {
        if (currentNoteId) {
          // Update existing note
          const updatedNote = await updateNote(currentNoteId, title, content);
          const index = notes.findIndex(n => n._id === currentNoteId);
          if (index !== -1) {
            notes[index] = updatedNote;
          }
        } else {
          // Create new note
          const response = await createNote(title, content, userId);
          notes.unshift(response.note);
        }
        
        renderNotes();
        closeModal();
      } catch (error) {
        modalErrorMessage.textContent = error.message || 'Failed to save note';
        modalErrorMessage.classList.remove('hidden');
      } finally {
        saveNoteButton.disabled = false;
        saveNoteButton.textContent = 'Save Note';
      }
    });
  }

  // Modal event handlers
  if (createNoteButton) {
    createNoteButton.addEventListener('click', () => openModal());
  }

  if (closeModalButton) {
    closeModalButton.addEventListener('click', closeModal);
  }

  if (cancelButton) {
    cancelButton.addEventListener('click', closeModal);
  }

  // Close modal when clicking outside
  if (noteModal) {
    noteModal.addEventListener('click', (e) => {
      if (e.target === noteModal) {
        closeModal();
      }
    });
  }

  // Escape key to close modal
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && !noteModal.classList.contains('hidden')) {
      closeModal();
    }
  });

  // Load notes on init
  await loadNotes();
};

// Helper function to escape HTML
const escapeHtml = (text) => {
  const div = document.createElement('div');
  div.textContent = text;
  return div.innerHTML;
};


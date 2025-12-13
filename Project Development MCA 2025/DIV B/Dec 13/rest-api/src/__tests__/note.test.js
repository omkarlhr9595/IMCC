import request from 'supertest';
import app from '../app.js';
import Note from '../models/Notes.js';
import User from '../models/User.js';
import { generateToken } from '../utils/jwt.js';
import { describe, test, expect, beforeEach } from '@jest/globals';
import bcrypt from 'bcryptjs';
import './setup.js';

describe('Note API Tests', () => {
  let authToken;
  let testUserId;
  let testNoteId;

  const testUserData = {
    username: 'notetestuser',
    email: 'notetest@example.com',
    firstName: 'Note',
    lastName: 'Tester',
    password: 'testpassword123',
  };

  const testNoteData = {
    title: 'Test Note',
    content: 'This is a test note content',
  };

  // Setup: Create a user and get auth token before all tests
  beforeEach(async () => {
    const hashedPassword = await bcrypt.hash(testUserData.password, 10);
    
    const user = new User({
      ...testUserData,
      password: hashedPassword,
    });
    await user.save();
    testUserId = user._id;

    const tokenPayload = {
      userId: user._id.toString(),
      email: user.email,
      username: user.username,
    };
    authToken = generateToken(tokenPayload, '7d');
  });

  describe('POST /api/notes - Create Note', () => {
    test('should create a new note with valid token', async () => {
      const noteData = {
        ...testNoteData,
        userId: testUserId,
      };

      const response = await request(app)
        .post('/api/notes')
        .set('Authorization', `Bearer ${authToken}`)
        .send(noteData)
        .expect(201);

      expect(response.body).toHaveProperty('message', 'Note created successfully');
      expect(response.body).toHaveProperty('note');
      expect(response.body.note).toHaveProperty('title', testNoteData.title);
      expect(response.body.note).toHaveProperty('content', testNoteData.content);
      expect(response.body.note).toHaveProperty('userId', testUserId.toString());

      // Store for later tests
      testNoteId = response.body.note._id;
    });

    test('should fail to create note without authentication token', async () => {
      const response = await request(app)
        .post('/api/notes')
        .send({
          ...testNoteData,
          userId: testUserId,
        })
        .expect(401);

      expect(response.body).toHaveProperty('error', 'Access token required');
    });

    test('should fail to create note with missing required fields', async () => {
      const response = await request(app)
        .post('/api/notes')
        .set('Authorization', `Bearer ${authToken}`)
        .send({ title: 'Only Title' })
        .expect(500);

      expect(response.body).toHaveProperty('error');
    });
  });

  describe('GET /api/notes - Get All Notes', () => {
    beforeEach(async () => {
      // User is already created by parent beforeEach, just create notes
      // Create some test notes
      const note1 = new Note({
        title: 'Note 1',
        content: 'Content 1',
        userId: testUserId,
      });
      const note2 = new Note({
        title: 'Note 2',
        content: 'Content 2',
        userId: testUserId,
      });
      await note1.save();
      await note2.save();
    });

    test('should get all notes with valid token', async () => {
      const response = await request(app)
        .get('/api/notes')
        .set('Authorization', `Bearer ${authToken}`)
        .expect(200);

      expect(Array.isArray(response.body)).toBe(true);
      expect(response.body.length).toBeGreaterThanOrEqual(2);
      expect(response.body[0]).toHaveProperty('title');
      expect(response.body[0]).toHaveProperty('content');
      expect(response.body[0]).toHaveProperty('userId');
    });

    test('should return 404 if no notes found', async () => {
      // Clear all notes
      await Note.deleteMany({});

      const response = await request(app)
        .get('/api/notes')
        .set('Authorization', `Bearer ${authToken}`)
        .expect(404);

      expect(response.body).toHaveProperty('error', 'No notes found');
    });

    test('should fail without authentication token', async () => {
      const response = await request(app)
        .get('/api/notes')
        .expect(401);

      expect(response.body).toHaveProperty('error', 'Access token required');
    });

    test('should fail with invalid token', async () => {
      const response = await request(app)
        .get('/api/notes')
        .set('Authorization', 'Bearer invalidtoken')
        .expect(403);

      expect(response.body).toHaveProperty('error');
    });
  });

  describe('GET /api/notes/:id - Get Note By ID', () => {
    beforeEach(async () => {
      // User is already created by parent beforeEach, just create note
      const note = new Note({
        ...testNoteData,
        userId: testUserId,
      });
      await note.save();
      testNoteId = note._id;
    });

    test('should get note by ID with valid token', async () => {
      const response = await request(app)
        .get(`/api/notes/${testNoteId}`)
        .set('Authorization', `Bearer ${authToken}`)
        .expect(200);

      expect(response.body).toHaveProperty('_id', testNoteId.toString());
      expect(response.body).toHaveProperty('title', testNoteData.title);
      expect(response.body).toHaveProperty('content', testNoteData.content);
      expect(response.body).toHaveProperty('userId', testUserId.toString());
    });

    test('should return 404 for non-existent note', async () => {
      const fakeId = '507f1f77bcf86cd799439011';
      const response = await request(app)
        .get(`/api/notes/${fakeId}`)
        .set('Authorization', `Bearer ${authToken}`)
        .expect(404);

      expect(response.body).toHaveProperty('error', 'Note not found');
    });

    test('should fail without authentication token', async () => {
      const response = await request(app)
        .get(`/api/notes/${testNoteId}`)
        .expect(401);

      expect(response.body).toHaveProperty('error', 'Access token required');
    });
  });

  describe('PUT /api/notes/:id - Update Note', () => {
    beforeEach(async () => {
      // User is already created by parent beforeEach, just create note
      const note = new Note({
        ...testNoteData,
        userId: testUserId,
      });
      await note.save();
      testNoteId = note._id;
    });

    test('should update note with valid token', async () => {
      const updateData = {
        title: 'Updated Note Title',
        content: 'Updated note content',
      };

      const response = await request(app)
        .put(`/api/notes/${testNoteId}`)
        .set('Authorization', `Bearer ${authToken}`)
        .send(updateData)
        .expect(200);

      expect(response.body).toHaveProperty('title', 'Updated Note Title');
      expect(response.body).toHaveProperty('content', 'Updated note content');
      expect(response.body).toHaveProperty('_id', testNoteId.toString());
    });

    test('should update only title', async () => {
      const updateData = {
        title: 'Only Title Updated',
      };

      const response = await request(app)
        .put(`/api/notes/${testNoteId}`)
        .set('Authorization', `Bearer ${authToken}`)
        .send(updateData)
        .expect(200);

      expect(response.body).toHaveProperty('title', 'Only Title Updated');
    });

    test('should return 404 for non-existent note', async () => {
      const fakeId = '507f1f77bcf86cd799439011';
      const response = await request(app)
        .put(`/api/notes/${fakeId}`)
        .set('Authorization', `Bearer ${authToken}`)
        .send({ title: 'Updated' })
        .expect(404);

      expect(response.body).toHaveProperty('error', 'Note not found');
    });

    test('should fail without authentication token', async () => {
      const response = await request(app)
        .put(`/api/notes/${testNoteId}`)
        .send({ title: 'Updated' })
        .expect(401);

      expect(response.body).toHaveProperty('error', 'Access token required');
    });
  });

  describe('DELETE /api/notes/:id - Delete Note', () => {
    beforeEach(async () => {
      // User is already created by parent beforeEach, just create note
      const note = new Note({
        ...testNoteData,
        userId: testUserId,
      });
      await note.save();
      testNoteId = note._id;
    });

    test('should delete note with valid token', async () => {
      const response = await request(app)
        .delete(`/api/notes/${testNoteId}`)
        .set('Authorization', `Bearer ${authToken}`)
        .expect(200);

      expect(response.body).toHaveProperty('message', 'Note deleted successfully');

      // Verify note is deleted
      const deletedNote = await Note.findById(testNoteId);
      expect(deletedNote).toBeNull();
    });

    test('should fail without authentication token', async () => {
      const response = await request(app)
        .delete(`/api/notes/${testNoteId}`)
        .expect(401);

      expect(response.body).toHaveProperty('error', 'Access token required');
    });

    test('should handle deleting non-existent note gracefully', async () => {
      const fakeId = '507f1f77bcf86cd799439011';
      const response = await request(app)
        .delete(`/api/notes/${fakeId}`)
        .set('Authorization', `Bearer ${authToken}`)
        .expect(200);

      expect(response.body).toHaveProperty('message', 'Note deleted successfully');
    });
  });
});


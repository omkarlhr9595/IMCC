import mongoose from 'mongoose';
import config from '../config/index.js';
import { beforeAll, afterAll, beforeEach } from '@jest/globals';

// Connect to test database before all tests
beforeAll(async () => {
  // Use a test database or the same database with a test prefix
  const testMongoUri = config.mongoUri.replace(/\/([^/]+)$/, '/test-$1') || config.mongoUri;
  try {
    await mongoose.connect(testMongoUri);
  } catch (error) {
    // If connection fails, try original URI
    await mongoose.connect(config.mongoUri);
  }
});

// Clean up after all tests
afterAll(async () => {
  await mongoose.connection.close();
});

// Clean database before each test
beforeEach(async () => {
  const collections = mongoose.connection.collections;
  for (const key in collections) {
    await collections[key].deleteMany({});
  }
});


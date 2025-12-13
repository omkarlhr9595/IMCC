export default {
  testEnvironment: 'node',
  transform: {},
  moduleNameMapper: {
    '^(\\.{1,2}/.*)\\.js$': '$1',
  },
  testMatch: ['**/__tests__/**/*.test.js'],
  collectCoverageFrom: [
    'src/**/*.js',
    '!src/index.js',
    '!src/__tests__/**',
  ],
  verbose: true,
  setupFilesAfterEnv: ['<rootDir>/src/__tests__/setup.js'],
};


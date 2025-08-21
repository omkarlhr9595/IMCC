class ApiConfig {
  ApiConfig._();

  static const String tmdbBaseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrlW500 = 'https://image.tmdb.org/t/p/w500';
  static const String imageBaseUrlOriginal = 'https://image.tmdb.org/t/p/original';

  // Replace with your TMDB API key or use a secure secret management strategy.
  // For production, prefer using runtime configuration or platform-specific secrets.
  static const String tmdbApiKey = 'asdfasdfads';
}
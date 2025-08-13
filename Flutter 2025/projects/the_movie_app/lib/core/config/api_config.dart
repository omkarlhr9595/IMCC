import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  ApiConfig._();

  static const String tmdbBaseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrlW500 = 'https://image.tmdb.org/t/p/w500';
  static const String imageBaseUrlOriginal = 'https://image.tmdb.org/t/p/original';

  static String tmdbApiKey = dotenv.get('TMDB_API_KEY');
}

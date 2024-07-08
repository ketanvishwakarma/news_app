import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsApiConstants {
  const NewsApiConstants._();

  static final key = dotenv.get('NEWS_API_KEY');
  static final googleClientId = dotenv.get('GOOGLE_CLIENT_ID');
  static const baseUrl = 'https://newsapi.org/v2';

  //endpoints
  static const topHeadlines = '/top-headlines';
  static const everything = '/everything';
}

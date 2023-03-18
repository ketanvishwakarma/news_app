import 'package:news_app/core/constants/key_constants.dart';

class NewsApiConstants {
  const NewsApiConstants._();

  static const key = NEWS_API_KEY;

  static const baseUrl = 'https://newsapi.org/v2';

  //endpoints
  static const topHeadlines = '/top-headlines';
  static const everything = '/everything';
}

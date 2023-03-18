import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/models/article/article.dart';

part 'news_paginated_response.freezed.dart';
part 'news_paginated_response.g.dart';

// ! Sample, success response
// {
//     "status": "ok",
//     "totalResults": 38,
//     "articles": [
//         {
//             "source": {
//                 "id": null,
//                 "name": "The Indian Express"
//             },
//             "author": "Tanishq Vaddi",
//             "title": "IND vs AUS Live Score: Mohammed Shami picks up Marcus Stoinis, Australia seven down - The Indian Express",
//             "description": "India vs Australia 1st ODI Live Score Updates: India will take on Australia in the first ODI of the three-match series at the Wankhede Stadium. Catch latest updates of Ind vs Aus 1st ODI",
//             "url": "https://indianexpress.com/article/sports/cricket/india-vs-australia-live-score-ind-vs-aus-1st-odi-2023-latest-updates-at-wankhede-stadium-mumbai-8502433/",
//             "urlToImage": "https://images.indianexpress.com/2023/03/ind-vs-aus-india-vs-australia-live.jpeg",
//             "publishedAt": "2023-03-17T10:40:00Z",
//             "content": "Ravindra Jadeja, Mohammed Siraj and Mohammed Shami in action. (AP)\r\nSqauds\r\nAustralia: Steve Smith (c), Sean Abbott, Ashton Agar, Alex Carey, Nathan Ellis, Cameron Green, Travis Head, Josh Inglis, Ma… [+382 chars]"
//         },
//         {
//             "source": {
//                 "id": "the-hindu",
//                 "name": "The Hindu"
//             },
//             "author": "The Hindu",
//             "title": "Air India makes another voluntary retirement offer for staff - The Hindu",
//             "description": null,
//             "url": "https://www.thehindu.com/business/air-india-makes-another-voluntary-retirement-offer-for-staff/article66630301.ece",
//             "urlToImage": null,
//             "publishedAt": "2023-03-17T06:47:00Z",
//             "content": null
//         }
//     ]
// }

@freezed
class NewsPaginatedResponse with _$NewsPaginatedResponse {
  factory NewsPaginatedResponse({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) = _NewsPaginatedResponse;

  factory NewsPaginatedResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsPaginatedResponseFromJson(json);
}

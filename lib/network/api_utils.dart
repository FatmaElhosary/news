import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/sources_response/sources_response.dart';
import 'package:news/network/api_constants.dart';

class ApiUtils {
  static Future<SourcesResponse> getSources(String source) async {
    Uri url = Uri.https('newsapi.org', '/v2/top-headlines/sources',
        {"apiKey": 'fc8d3a02c2fb4a459b0b7b020620e678', "category": source});
    var res = await http.get(url);
    print(res.body);
    print(res.statusCode);
    if (res.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SourcesResponse.fromJson(
          jsonDecode(res.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Sources');
    }
  }
}
// Uri.parse(
        // '${ApiConstants.baseUrl}/v2/top-headlines/sources?apiKey=${ApiConstants.apiKEY}&category=$source')
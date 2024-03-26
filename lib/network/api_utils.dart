import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/news_response.dart';
import 'package:news/models/sources_response.dart';
import 'package:news/network/api_constants.dart';

class ApiUtils {
  static Future<SourcesResponse> getSources(String source) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceEndpoint, {
      "apiKey": ApiConstants.apiKEY,
      "category": source,
    });
    try {
      var res = await http.get(url);
      return SourcesResponse.fromJson(
          jsonDecode(res.body) as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }

    /*  if (res.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SourcesResponse.fromJson(
          jsonDecode(res.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
        throw Exception('Failed to load Sources');
      //rethrow;
    } */
  }

  static Future<NewsResponse> getNewsbySourceId(String sources) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndpoint,
        {"apiKey": ApiConstants.apiKEY, "sources": sources});
    try {
      var res = await http.get(url);
      return NewsResponse.fromJson(
          jsonDecode(res.body) as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  //search news
  static Future<NewsResponse> getNewsbyQ(String q) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndpoint,
        {"apiKey": ApiConstants.apiKEY, "q": q});
    try {
      var res = await http.get(url);
      return NewsResponse.fromJson(
          jsonDecode(res.body) as Map<String, dynamic>);
    } catch (e) {
      print(e);
      rethrow;
      //rethrow;
    }
  }
}

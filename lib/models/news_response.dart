import 'package:news/models/sources_response.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? message;
  NewsResponse({this.status, this.totalResults, this.articles, this.message});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    message = json['message'];
    articles = json["articles"] == null
        ? null
        : (json["articles"] as List).map((e) => Article.fromJson(e)).toList();
  }

  
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Article.fromJson(Map<String, dynamic> json) {
    source = json["source"] == null ? null : Source.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data["source"] = source?.toJson();
    }
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["content"] = content;
    return data;
  }
}


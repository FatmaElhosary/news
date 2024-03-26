class SourcesResponse {
  String? status;
  List<Source>? sources;
  String? message;
  SourcesResponse({this.status, this.sources, this.message});

  SourcesResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json['message'];
    sources = json["sources"] == null
        ? null
        : (json["sources"] as List).map((e) => Source.fromJson(e)).toList();
  }
}

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Source.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["url"] = url;
    data["category"] = category;
    data["language"] = language;
    data["country"] = country;
    return data;
  }
}

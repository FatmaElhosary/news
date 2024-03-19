import 'source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;
  SourcesResponse({this.status, this.sources});
  /*  SourcesResponse.fromJson(Map<String, dynamic> json)
      : this(sources: json['sources'], status: json['status']); */

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'status': String? status, 'sources': List<Source>? sources} =>
        SourcesResponse(sources: sources, status: status),
      _ => throw const FormatException('faild to load Sources')
    };
  }
}

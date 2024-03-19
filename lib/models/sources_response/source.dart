class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source.fromJson(Map<String, dynamic> json)
      : this(
          category: json['category'],
          country: json['country'],
          description: json['description'],
          language: json['language'],
          name: json['name'],
          url: json['url'],
          id: json['id'],
        );
}

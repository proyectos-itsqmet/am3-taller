class Poster {
  int id;
  String name;
  String url;

  Poster({
    required this.id,
    required this.name,
    required this.url,
  });

  int get getId {
    return id;
  }

  String get getName {
    return name;
  }

  String get getUrl {
    return url;
  }

  void setId(int id) {
    this.id = id;
  }

  void setName(String name) {
    this.name = name;
  }

  void setUrl(String url) {
    this.url = url;
  }
}
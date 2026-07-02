import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  final int id;
  String name;
  String? description;
  String? rated;
  String? type;
  DateTime? releaseDate;
  int? duration;
  String? posterUrl;
  String? videoUrl;
  double? voteAverage;
  String? genreName;

  Item({
    required this.id,
    required this.name,
    this.description,
    this.rated,
    this.type,
    this.releaseDate,
    this.duration,
    this.posterUrl,
    this.videoUrl,
    this.voteAverage,
    this.genreName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"] ?? "",
    description: json["description"] ?? "",
    rated: json["rated"] ?? "",
    type: json["type"] ?? "",
    releaseDate: json["release_date"] == null
        ? null
        : DateTime.parse(json["release_date"]),
    duration: int.tryParse(json["duration"].toString()),
    posterUrl: json["poster_url"] ?? "",
    videoUrl: json["video_url"] ?? "",
    voteAverage: double.tryParse(json["vote_average"].toString()),
    genreName: json["genre_name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "rated": rated,
    "type": type,
    "release_date": releaseDate == null
        ? null
        : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "duration": duration,
    "poster_url": posterUrl,
    "video_url": videoUrl,
    "vote_average": voteAverage,
    "genre_name": genreName,
  };
}

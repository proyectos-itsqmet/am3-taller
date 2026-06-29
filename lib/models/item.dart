class Item {
  final int id;
  final String name;
  final String description;
  final String rated;
  final String? type;
  String? releaseDate;
  int? duration;
  String? posterUrl;
  String? videoUrl;
  double? voteAverage;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.rated,
    required this.type,
    this.releaseDate,
    this.duration,
    this.posterUrl,
    this.videoUrl,
    this.voteAverage,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String? ?? "",
      description: map['description'] as String? ?? "",
      rated: map['rated'] as String? ?? "",
      type: map['type'] as String?,
      releaseDate: map['release_date'] as String?,
      duration: map['duration'] as int?,
      posterUrl: map['poster_url'] as String?,
      videoUrl: map['video_url'] as String?,
      voteAverage: (map['vote_average'] as num?)?.toDouble(),
    );
  }
}

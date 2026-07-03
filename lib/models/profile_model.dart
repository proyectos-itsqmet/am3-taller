class ProfileModel {
  final String id;
  final String avatar;
  final String name;

  ProfileModel({required this.id, required this.avatar, required this.name});

  ProfileModel copyWith({String? id, String? avatar, String? name}) {
    return ProfileModel(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
    );
  }
}

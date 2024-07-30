import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserSaveDto {
  final String name;
  final String email;
  final String? image;
  UserSaveDto({
    required this.name,
    required this.email,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'image': image,
    };
  }

  factory UserSaveDto.fromMap(Map<String, dynamic> map) {
    return UserSaveDto(
      name: map['name'] as String,
      email: map['email'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSaveDto.fromJson(String source) =>
      UserSaveDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant UserSaveDto other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ image.hashCode;
}

import 'dart:convert';

class GithubModel {
  final String image;
  final String name;
  final String nickname;
  final String url;

  const GithubModel({
    required this.image,
    required this.name,
    required this.nickname,
    required this.url,
  });

  GithubModel copyWith({
    String? image,
    String? name,
    String? nickname,
    String? url,
  }) {
    return GithubModel(
      image: image ?? this.image,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'nickname': nickname,
      'url': url,
    };
  }

  factory GithubModel.fromMap(Map<String, dynamic> map) {
    return GithubModel(
      image: map['image'],
      name: map['name'],
      nickname: map['nickname'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubModel.fromJson(String source) => GithubModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GithubModel(image: $image, name: $name, nickname: $nickname, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GithubModel &&
      other.image == image &&
      other.name == name &&
      other.nickname == nickname &&
      other.url == url;
  }

  @override
  int get hashCode {
    return image.hashCode ^
      name.hashCode ^
      nickname.hashCode ^
      url.hashCode;
  }
}

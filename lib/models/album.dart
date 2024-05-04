import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable()
class Album {
  int userId;
  int id;
  String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> data) => _$AlbumFromJson(data);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

import 'package:music_recomendations/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    required String id,
    required String title,
    required String artist,
  }) : super(id: id, title: title, artist: artist);

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
    );
  }
}

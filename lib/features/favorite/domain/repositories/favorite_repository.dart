import 'package:music_recomendations/features/favorite/domain/entities/favorite_entity.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteEntity>> fetchFavorites();
  Future<void> addFavorite({required String title, required String artist});
  Future<void> deleteFavorite({required String id});
}


import 'package:music_recomendations/features/favorite/domain/entities/favorite_entity.dart';
import 'package:music_recomendations/features/favorite/domain/repositories/favorite_repository.dart';

class FetchFavoritesUseCase {
  final FavoriteRepository favoriteRepository;

  FetchFavoritesUseCase({required this.favoriteRepository});

  Future<List<FavoriteEntity>> call() async {
    return await favoriteRepository.fetchFavorites();
  }
}

import 'package:music_recomendations/features/favorite/domain/repositories/favorite_repository.dart';

class DeleteFavoriteUseCase {
  final FavoriteRepository favoriteRepository;

  DeleteFavoriteUseCase({required this.favoriteRepository});

  Future<void> call({required String id}) async {
    return await favoriteRepository.deleteFavorite(id: id);
  }
}

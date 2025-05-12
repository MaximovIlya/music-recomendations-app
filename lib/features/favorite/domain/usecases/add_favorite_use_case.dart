import 'package:music_recomendations/features/favorite/domain/repositories/favorite_repository.dart';

class AddFavoriteUseCase {
  final FavoriteRepository favoriteRepository;

  AddFavoriteUseCase({required this.favoriteRepository});

  Future<void> call({required String title, required String artist}) async {
    return await favoriteRepository.addFavorite(title: title, artist: artist);
  }
}

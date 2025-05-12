import 'package:music_recomendations/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:music_recomendations/features/favorite/domain/entities/favorite_entity.dart';
import 'package:music_recomendations/features/favorite/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository{
  final FavoriteRemoteDataSource remoteDataSource;

  FavoriteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addFavorite({required String title, required String artist}) async {
    return await remoteDataSource.addFavorite(title: title, artist: artist);
  }

  @override
  Future<List<FavoriteEntity>> fetchFavorites() async {
    return await remoteDataSource.fetchFavorites();
  }

  @override
  Future<void> deleteFavorite({required String id}) async {
    return await remoteDataSource.deleteFavorite(id: id);
  }
}
  

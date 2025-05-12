import 'package:music_recomendations/features/favorite/domain/entities/favorite_entity.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> songs;

  FavoriteLoaded(this.songs);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}

class FavoriteAdded extends FavoriteState {}

class FavoriteDeleted extends FavoriteState {}


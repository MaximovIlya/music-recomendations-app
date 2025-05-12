import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/features/favorite/domain/usecases/add_favorite_use_case.dart';
import 'package:music_recomendations/features/favorite/domain/usecases/delete_favorite_use_case.dart';
import 'package:music_recomendations/features/favorite/domain/usecases/fetch_favorites_use_case.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_event.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FetchFavoritesUseCase fetchFavoritesUseCase;
  final AddFavoriteUseCase addFavoriteUseCase;
  final DeleteFavoriteUseCase deleteFavoriteUseCase;

  FavoriteBloc(
      {required this.fetchFavoritesUseCase,
      required this.addFavoriteUseCase,
      required this.deleteFavoriteUseCase})
      : super(FavoriteInitial()) {
    on<FetchFavorites>(_onFetchFavorites);
    on<AddFavorite>(_onAddFavorite);
    on<DeleteFavorite>(_onDeleteFavorite);
  }

  Future<void> _onFetchFavorites(
      FetchFavorites event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final songs = await fetchFavoritesUseCase();
      emit(FavoriteLoaded(songs));
    } catch (error) {
      emit(FavoriteError('Failed to fetch songs}'));
    }
  }

  Future<void> _onAddFavorite(
      AddFavorite event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      await addFavoriteUseCase(title: event.title, artist: event.artist);
      emit(FavoriteAdded());
      add(FetchFavorites());
    } catch (error) {
      emit(FavoriteError('Failed to fetch songs'));
    }
  }

  Future<void> _onDeleteFavorite(
      DeleteFavorite event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      await deleteFavoriteUseCase(id: event.id);
      emit(FavoriteDeleted());
      add(FetchFavorites());
    } catch (error) {
      emit(FavoriteError('Failed to fetch songs'));
    }
  }
}

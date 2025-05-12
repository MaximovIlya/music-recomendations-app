abstract class FavoriteEvent {}

class FetchFavorites extends FavoriteEvent {}

class AddFavorite extends FavoriteEvent {
  final String title;
  final String artist;

  AddFavorite({required this.title, required this.artist});
}

class DeleteFavorite extends FavoriteEvent {
  final String id;

  DeleteFavorite({required this.id});
}

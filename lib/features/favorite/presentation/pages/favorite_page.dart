import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_event.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_state.dart';
import 'package:music_recomendations/features/recomendations/presentation/widgets/song_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(FetchFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withValues(alpha: 0.7), 
        elevation: 0, 
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FavoriteLoaded) {
            final songs = state.songs;
            if (songs.isEmpty) {
              return Center(child: Text('No favorite songs found.'));
            } else {
              return ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return SongCard(songId: song.id, title: song.title, artist: song.artist, isInitiallyFavorite: true,);
                },
              );
            }
          } else if (state is FavoriteError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No favorite songs found.'));
          }
        },
      ),
    );
  }
}

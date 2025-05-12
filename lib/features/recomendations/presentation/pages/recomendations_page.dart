import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_state.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_event.dart';
import 'package:music_recomendations/features/favorite/presentation/bloc/favorite_state.dart';
import 'package:music_recomendations/features/recomendations/presentation/widgets/song_card.dart';

class RecomendationsPage extends StatefulWidget {
  const RecomendationsPage({super.key});

  @override
  State<RecomendationsPage> createState() => _RecomendationsPageState();
}

class _RecomendationsPageState extends State<RecomendationsPage> {
  Map<String, String> songIdByTitle = {}; 

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
          "Playlist",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withValues(alpha: 0.7), 
        elevation: 0, 
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<ChooseMoodBloc, ChooseMoodState>(
        builder: (context, moodState) {
          if (moodState is ChooseMoodLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (moodState is ChooseMoodLoadedState) {
            final songs = moodState.songs;

            return BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, favoriteState) {
                final favoriteTitles = <String>{};

                if (favoriteState is FavoriteLoaded) {
                  
                  for (var favorite in favoriteState.songs) {
                    favoriteTitles.add(favorite.title.toLowerCase());
                    songIdByTitle[favorite.title.toLowerCase()] = favorite.id; 
                  }
                }

                return ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    final song = songs[index];
                    final isFavorite = favoriteTitles.contains(song.title.toLowerCase());

                    return SongCard(
                      title: song.title,
                      artist: song.artist,
                      isInitiallyFavorite: isFavorite,
                      songId: songIdByTitle[song.title.toLowerCase()], 
                    );
                  },
                );
              },
            );
          } else if (moodState is ChooseMoodErrorState) {
            return Center(child: Text('Error: ${moodState.message}'));
          } else {
            return const Center(child: Text('Choose a mood to get started.'));
          }
        },
      ),
    );
  }
}

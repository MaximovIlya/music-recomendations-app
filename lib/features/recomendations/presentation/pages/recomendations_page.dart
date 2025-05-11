import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_bloc.dart';
import 'package:music_recomendations/features/choose_mood/presentation/bloc/choose_mood_state.dart';
import 'package:music_recomendations/features/recomendations/presentation/widgets/song_card.dart';

class RecomendationsPage extends StatelessWidget {
  const RecomendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Recommendations')),
      body: BlocBuilder<ChooseMoodBloc, ChooseMoodState>(
        builder: (context, state) {
          if (state is ChooseMoodLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ChooseMoodLoadedState) {
            final songs = state.songs;
            return ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return SongCard(
                  title: song.title,
                  artist: song.artist,
                  explanation: song.explanation,
                );
              },
            );
          } else if (state is ChooseMoodErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('Choose a mood to get started.'));
          }
        },
      ),
    );
  }
}

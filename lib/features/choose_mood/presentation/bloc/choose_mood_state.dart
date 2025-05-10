import 'package:music_recomendations/features/choose_mood/domain/entities/choose_mood_entity.dart';

abstract class ChooseMoodState {}

class ChooseMoodLoadingState extends ChooseMoodState {}

class ChooseMoodLoadedState extends ChooseMoodState {
  final List<ChooseMoodEntity> songs;
  ChooseMoodLoadedState(this.songs);
}

class ChooseMoodErrorState extends ChooseMoodState {
  final String message;
  ChooseMoodErrorState(this.message);
}
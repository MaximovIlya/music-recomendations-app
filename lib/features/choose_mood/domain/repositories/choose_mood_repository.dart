import 'package:music_recomendations/features/choose_mood/domain/entities/choose_mood_entity.dart';

abstract class ChooseMoodRepository {
  Future<List<ChooseMoodEntity>> generateMoodMusic(String message);
}
import 'package:music_recomendations/features/choose_mood/domain/entities/choose_mood_entity.dart';
import 'package:music_recomendations/features/choose_mood/domain/repositories/choose_mood_repository.dart';

class ChooseMoodUseCase {
  final ChooseMoodRepository chooseMoodRepository;

  ChooseMoodUseCase({required this.chooseMoodRepository});


  Future<List<ChooseMoodEntity>>call(String message) async {
    return await chooseMoodRepository.generateMoodMusic(message);
  }
}
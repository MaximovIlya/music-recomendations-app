import 'package:music_recomendations/features/choose_mood/data/datasource/choose_mood_remote_data_source.dart';
import 'package:music_recomendations/features/choose_mood/domain/entities/choose_mood_entity.dart';
import 'package:music_recomendations/features/choose_mood/domain/repositories/choose_mood_repository.dart';

class ChooseMoodRepositoryImpl implements ChooseMoodRepository{
  final ChooseMoodRemoteDataSource remoteDataSource;

  ChooseMoodRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ChooseMoodEntity>> generateMoodMusic(String message) async {
    return await remoteDataSource.generateMoodMusic(message);
  }
}
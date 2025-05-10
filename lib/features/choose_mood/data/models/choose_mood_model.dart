
import 'package:music_recomendations/features/choose_mood/domain/entities/choose_mood_entity.dart';

class ChooseMoodModel extends ChooseMoodEntity {
  ChooseMoodModel({required String title, required String artist, required String explanation}) : super(title: title, artist: artist, explanation: explanation);

  factory ChooseMoodModel.fromJson(Map<String, dynamic> json) {
    return ChooseMoodModel(
      title: json['title'],
      artist: json['artist'],
      explanation: json['explanation']
    );
  }
}

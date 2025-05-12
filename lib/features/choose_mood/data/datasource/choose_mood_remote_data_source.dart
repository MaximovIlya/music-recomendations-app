import 'dart:async';

import 'package:music_recomendations/core/socket_service.dart';
import 'package:music_recomendations/features/choose_mood/data/models/choose_mood_model.dart';

class ChooseMoodRemoteDataSource {
  final String baseUrl = 'http://localhost:6000';
  final SocketService _socketService = SocketService();

  Future<List<ChooseMoodModel>> generateMoodMusic(String mood, String favorites, String nature) async {
    final completer = Completer<List<ChooseMoodModel>>();

    _socketService.socket.emit('generateMusic', [mood, favorites, nature]);

    _socketService.socket.once('musicListCreated', (data) {
      print(data);
      try {
        final List<dynamic> decoded = data; 
        final models =
            decoded.map((item) => ChooseMoodModel.fromJson(item)).toList();
        completer.complete(models);
      } catch (e) {
        print('Ошибка при парсинге JSON: $e');
        completer.completeError('Ошибка при обработке данных');
      }
    });

    return completer.future;
  }
}

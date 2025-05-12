import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:music_recomendations/features/favorite/data/models/favorite_model.dart';
import 'package:music_recomendations/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteRemoteDataSource {
  final String baseUrl = 'http://localhost:6000/favorite';
  final _storage = FlutterSecureStorage();

  Future<List<FavoriteEntity>> fetchFavorites() async {
    String token = await _storage.read(key: 'token') ?? '';
    final response = await http.get(
        Uri.parse('$baseUrl/fetchFavorites'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => FavoriteModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch favorite songs');
    }
  }

  Future<void> addFavorite({required String title, required String artist}) async {
    String token = await _storage.read(key: 'token') ?? '';
    final response = await http.post(Uri.parse('$baseUrl/addFavorite'),
        body: jsonEncode({'title': title, 'artist': artist}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode != 201) {
      throw Exception('Failed to add song to favorites');
    }
  }
  Future<void> deleteFavorite({required String id}) async {
    String token = await _storage.read(key: 'token') ?? '';
    final response = await http.post(Uri.parse('$baseUrl/deleteFavorite'),
        body: jsonEncode({'id': id}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode != 201) {
      throw Exception('Failed to delete song from favorites');
    }
  }
}
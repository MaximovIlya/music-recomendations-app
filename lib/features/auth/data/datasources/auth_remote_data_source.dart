import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_recomendations/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  final String baseUrl = 'http://localhost:6000/auth';

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    //print(response.body);
    return UserModel.fromJson(jsonDecode(response.body)['user']);
  }

  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await http.post(Uri.parse('$baseUrl/register'),
        body: jsonEncode(
            {'username': username, 'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'});

    //print(response.body);

    return UserModel.fromJson(jsonDecode(response.body)['user']);
  }
}

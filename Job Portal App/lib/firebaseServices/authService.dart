import 'dart:convert';

import 'package:firebasetask/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = FlutterSecureStorage();

  Future<void> authenticate(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://your-api.com/authenticate'),
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      final user = User.fromJson(data['user']);
      await storage.write(key: 'token', value: token);
      await storage.write(key: 'user', value: jsonEncode(user.toJson()));
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  Future<User?> getUser() async {
    final userJson = await storage.read(key: 'user');
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }
}

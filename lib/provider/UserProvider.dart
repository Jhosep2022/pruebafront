import 'dart:convert';
import 'package:pruebafront/environment/UrlGlodal.dart';
import 'package:pruebafront/model/UserModel.dart';
import 'package:pruebafront/model/CreateUserModel.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final String baseUrl = UrlGlobal.baseUrl;

  Future<List<Data>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> usersJson = jsonResponse['data'];
      return usersJson.map((user) => Data.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Data> fetchUserById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Data.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<Data> createUser(CreateUserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return Data.fromJson(jsonResponse['data']);
    } else {
      print('Failed to create user: ${response.body}');
      throw Exception('Failed to create user');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}

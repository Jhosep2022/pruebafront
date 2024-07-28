import 'package:flutter/material.dart';
import 'package:pruebafront/model/UserModel.dart';
import 'package:pruebafront/model/CreateUserModel.dart';
import 'package:pruebafront/provider/UserProvider.dart';

class UserService with ChangeNotifier {
  final UserProvider userProvider = UserProvider();
  List<Data> _users = [];
  Data? _user;

  List<Data> get users => _users;
  Data? get user => _user;

  Future<void> fetchUsers() async {
    try {
      _users = await userProvider.fetchUsers();
      print("Fetched users: $_users");
      notifyListeners();
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  Future<void> fetchUserById(String id) async {
    _user = await userProvider.fetchUserById(id);
    notifyListeners();
  }

  Future<void> createUser(CreateUserModel user) async {
    try {
      print("Creating user: ${user.toJson()}");
      await userProvider.createUser(user);
      await fetchUsers();
    } catch (e) {
      print("Error creating user: $e");
      rethrow;
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await userProvider.deleteUser(id);
      _users.removeWhere((user) => user.id == id);
      notifyListeners();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }
}

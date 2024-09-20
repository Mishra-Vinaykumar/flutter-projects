// lib/providers/user_provider.dart
import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<bool> login(String username, String password) async {
    final user = await DatabaseHelper().getUser(username);
    if (user != null && user.password == password) {
      _user = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> register(String username, String password) async {
    final user = User(username: username, password: password);
    await DatabaseHelper().insertUser(user);
  }
}

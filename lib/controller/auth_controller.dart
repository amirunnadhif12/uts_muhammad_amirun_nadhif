import 'package:flutter/material.dart';
import '../database/local_storage.dart';
import '../models/user_model.dart';

class AuthController extends ChangeNotifier {
  UserModel? user;

  bool get isLoggedIn => user != null;

  Future<bool> register({
    required String nama,
    required String telepon,
    required String alamat,
    required String username,
    required String password,
  }) async {
    user = UserModel(
      nama: nama,
      telepon: telepon,
      alamat: alamat,
      username: username,
      password: password,
    );
    await LocalStorage.saveUser(user!);
    notifyListeners();
    return true;
  }

  Future<bool> login(String username, String password) async {
    final saved = LocalStorage.getUser();
    if (saved == null) return false;
    if (saved.username == username && saved.password == password) {
      user = saved;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await LocalStorage.logoutUser();
    user = null;
    notifyListeners();
  }
}

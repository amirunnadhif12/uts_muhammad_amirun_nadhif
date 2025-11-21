import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../models/transaksi_model.dart';

class LocalStorage {
  static late SharedPreferences _prefs;
  static const _userKey = 'user_data';
  static const _transaksiKey = 'transaksi_list';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // user
  static Future<void> saveUser(UserModel user) async {
    await _prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  static UserModel? getUser() {
    final s = _prefs.getString(_userKey);
    if (s == null) return null;
    return UserModel.fromJson(jsonDecode(s));
  }

  static Future<void> logoutUser() async {
    await _prefs.remove(_userKey);
  }

  // transaksi
  static Future<void> saveTransaksiList(List<TransaksiModel> list) async {
    final encoded = jsonEncode(list.map((e) => e.toJson()).toList());
    await _prefs.setString(_transaksiKey, encoded);
  }

  static List<TransaksiModel> loadTransaksiList() {
    final s = _prefs.getString(_transaksiKey);
    if (s == null) return [];
    final parsed = jsonDecode(s) as List;
    return parsed.map((e) => TransaksiModel.fromJson(e)).toList();
  }
}

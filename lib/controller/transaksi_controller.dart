import 'package:flutter/material.dart';
import 'dart:math';
import '../database/local_storage.dart';
import '../models/transaksi_model.dart';

class TransaksiController extends ChangeNotifier {
  List<TransaksiModel> _list = [];

  List<TransaksiModel> get list => _list;

  TransaksiController() {
    _load();
  }

  void _load() {
    _list = LocalStorage.loadTransaksiList();
    notifyListeners();
  }

  Future<void> addTransaksi(TransaksiModel t) async {
    _list.insert(0, t);
    await LocalStorage.saveTransaksiList(_list);
    notifyListeners();
  }

  Future<void> updateTransaksi(TransaksiModel updated) async {
    final idx = _list.indexWhere((e) => e.id == updated.id);
    if (idx >= 0) {
      _list[idx] = updated;
      await LocalStorage.saveTransaksiList(_list);
      notifyListeners();
    }
  }

  Future<void> deleteTransaksi(String id) async {
    _list.removeWhere((e) => e.id == id);
    await LocalStorage.saveTransaksiList(_list);
    notifyListeners();
  }

  String generateId() {
    final r = Random().nextInt(999999);
    return DateTime.now().millisecondsSinceEpoch.toString() + r.toString();
  }
}

import 'package:flutter/material.dart';
import '../models/obat_model.dart';
import '../data_dummy/obat_dummy.dart';

class ObatController extends ChangeNotifier {
  List<ObatModel> _list = obatDummy;
  List<ObatModel> get list => _list;

  ObatModel? findById(String id) {
    try {
      return _list.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }
}

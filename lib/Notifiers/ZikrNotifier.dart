import 'package:flutter/material.dart';

class Zikrnotifier with ChangeNotifier {
  final List<Map<String, dynamic>> _nameJsonList = [];

  List<Map<String, dynamic>> get nameJsonList => _nameJsonList;

  void updateZikrList(Map<String, dynamic> newName) {
    _nameJsonList.add(newName);
    notifyListeners();
  }
}
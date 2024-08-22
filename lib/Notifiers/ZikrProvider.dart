import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZikrProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _nameJsonList = [];
  String? _selectedZikrName;

  UnmodifiableListView<Map<String, dynamic>> get items =>
      UnmodifiableListView(_nameJsonList);

  String? get selectedZikrName => _selectedZikrName;

  Map<String, dynamic> get selectedZikr {
    return _nameJsonList.firstWhere(
          (element) => element['name'] == _selectedZikrName,
      orElse: () => {'name': 'No Zikr Selected', 'count': 0},
    );
  }

  Future<void> addZikr(String newName) async {
    if (_nameJsonList.any((element) => element['name'] == newName)) return;

    _nameJsonList.add({
      "name": newName,
      "count": 0
    });
    await _saveToSharedPreferences();
    notifyListeners();
  }

  Future<void> updateZikr({required String zikrName, required int count}) async {
    final itemIndex = _nameJsonList.indexWhere((item) => item['name'] == zikrName);
    if (itemIndex == -1) {
      print('Item with name $zikrName not found');
      return;
    }

    _nameJsonList[itemIndex]['count'] = count;
    await _saveToSharedPreferences();
    notifyListeners();
  }

  Future<void> removeZikr(String zikrName) async {
    final itemIndex = _nameJsonList.indexWhere((item) => item['name'] == zikrName);
    if (itemIndex == -1) {
      print('Item with name $zikrName not found');
      return;
    }

    _nameJsonList.removeAt(itemIndex);
    if (_selectedZikrName == zikrName) {
      await selectZikr(null);
    }
    await _saveToSharedPreferences();
    notifyListeners();
  }

  Future<void> selectZikr(String? zikrName) async {
    if (zikrName != null && _nameJsonList.any((element) => element['name'] == zikrName)) {
      _selectedZikrName = zikrName;
    } else if (_nameJsonList.isNotEmpty) {
      _selectedZikrName = _nameJsonList[0]['name'];
    } else {
      _selectedZikrName = null;
    }
    await _saveToSharedPreferences();
    notifyListeners();
  }

  Future<void> _saveToSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(_nameJsonList);
      await prefs.setString('zikrList', jsonString);
      await prefs.setString('selectedZikrName', _selectedZikrName ?? '');
    } catch (e) {
      print('Error saving data to shared preferences: $e');
    }
  }

  Future<void> _loadFromSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final zikrListString = prefs.getString('zikrList');
      if (zikrListString != null) {
        final List<dynamic> decodedList = jsonDecode(zikrListString);
        _nameJsonList.clear();
        _nameJsonList.addAll(decodedList.map((e) => e as Map<String, dynamic>));
      }
      _selectedZikrName = prefs.getString('selectedZikrName');
    } catch (e) {
      print('Error loading data from shared preferences: $e');
    }
    notifyListeners();
  }

  Future<void> init() async {
    await _loadFromSharedPreferences();
  }
}

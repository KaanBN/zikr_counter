import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZikrProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _nameJsonList = [];
  String? _selectedZikrName;

  UnmodifiableListView<Map<String, dynamic>> get items => UnmodifiableListView([..._nameJsonList]);
  String? get selectedZikrName => _selectedZikrName;
  Map<String, dynamic> get selectedZikr => _nameJsonList.firstWhere((element) => element['name'] == _selectedZikrName);

  void addZikr(String newName)
  {
    if (!_nameJsonList.any((element) => element['name'] == newName)) {
      _nameJsonList.add({
        "name": newName,
        "count": 0
      });
      _saveToSharedPreferences();
      notifyListeners();
    }
  }

  void updateZikr({required String zikrName, required int count})
  {
    final itemIndex = _nameJsonList.indexWhere((item) => item['name'] == zikrName);
    if (itemIndex!= -1) {
      _nameJsonList[itemIndex]['count'] = count;
    } else {
      print('Item with name $zikrName not found');
    }
    _saveToSharedPreferences();
    notifyListeners();
  }

  void removeZikr(String zikrName) {
    final itemIndex = _nameJsonList.indexWhere((item) => item['name'] == zikrName);
    if (itemIndex!= -1) {
      _nameJsonList.removeAt(itemIndex);
      selectZikr(null);
    } else {
      print('Item with name $zikrName not found');
    }
    _saveToSharedPreferences();
    notifyListeners();
  }

  void selectZikr(String? zikrName) {
    if (zikrName!= null && _nameJsonList.any((element) => element['name'] == zikrName)) {
      _selectedZikrName = zikrName;
    } else if (_nameJsonList.isNotEmpty) {
      _selectedZikrName = _nameJsonList[0]['name'];
    } else {
      _selectedZikrName = null;
    }
    _saveToSharedPreferences();
    notifyListeners();
  }

  Future<void> _saveToSharedPreferences() async {
    final jsonEncoder = JsonEncoder();
    final jsonString = jsonEncoder.convert(_nameJsonList);
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('zikrList', jsonString);
      prefs.setString('selectedZikrName', _selectedZikrName?? '');
    });
  }


  Future<void> _loadFromSharedPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final zikrListString = prefs.getString('zikrList');
      if (zikrListString!= null) {
        _nameJsonList.clear();
        try {
          _nameJsonList.addAll((jsonDecode(zikrListString) as List)
              .map((e) => e as Map<String, dynamic>)
              .toList());
        } catch (e) {
          print('Error decoding JSON: $e');
        }
      }
      _selectedZikrName = prefs.getString('selectedZikrName');

      notifyListeners();
    } catch (e) {
      print('Error loading data from shared preferences: $e');
    } finally {
      notifyListeners();
    }
  }

  Future<void> init() async {
    await _loadFromSharedPreferences();
  }
}

import 'dart:collection';

import 'package:flutter/material.dart';

class ZikrProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _nameJsonList = [];
  String? _selectedZikrName;

  UnmodifiableListView<Map<String, dynamic>> get items => UnmodifiableListView(_nameJsonList);
  String? get selectedZikrName => _selectedZikrName;
  Map<String, dynamic>? get selectedZikr => _nameJsonList.firstWhere((element) => element['name'] == _selectedZikrName);


  void addZikr(String newName)
  {
    _nameJsonList.add({
      "name": newName,
      "count": 0
    });
    _selectedZikrName = newName;
    notifyListeners();
  }

  void updateZikr({required String zikrName, required int count})
  {
    final itemIndex = _nameJsonList.indexWhere((item) => item['name'] == zikrName);
    if (itemIndex!= -1) {
      _nameJsonList[itemIndex]['count'] = count;
    } else {
      print('Item with name $zikrName not found');
    }
    notifyListeners();
  }

  void removeZikr(String zikrName) {
    final itemIndex = _nameJsonList.indexWhere((item) => item['name'] == zikrName);
    if (itemIndex!= -1) {
      _nameJsonList.removeAt(itemIndex);
    } else {
      print('Item with name $zikrName not found');
    }
    notifyListeners();
  }

  void selectZikr(String zikrName) {
    _selectedZikrName = zikrName;
    notifyListeners();
  }
}
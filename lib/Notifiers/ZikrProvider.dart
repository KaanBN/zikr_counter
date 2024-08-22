import 'package:flutter/material.dart';
import 'package:zikir_sayar/Notifiers/ZikrNotifier.dart';

class Zikrprovider extends InheritedNotifier<Zikrnotifier> {
  final Zikrnotifier zikrName;

  Zikrprovider({super.key, required super.child})
      : zikrName = Zikrnotifier(),
        super(
        notifier: Zikrnotifier(),
      );

  static Zikrnotifier of(BuildContext context) {
    final Zikrprovider? result =
    context.dependOnInheritedWidgetOfExactType<Zikrprovider>();
    assert(result != null, 'No CounterProvider found in context');
    return result!.zikrName;
  }
}
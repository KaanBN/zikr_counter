// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{current counter is: {count}}`
  String counterCount(Object count) {
    return Intl.message(
      '{current counter is: $count}',
      name: 'counterCount',
      desc: '',
      args: [count],
    );
  }

  /// `reset counter`
  String get resetCounter {
    return Intl.message(
      'reset counter',
      name: 'resetCounter',
      desc: '',
      args: [],
    );
  }

  /// `increase counter`
  String get increaseCounter {
    return Intl.message(
      'increase counter',
      name: 'increaseCounter',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Go to list page`
  String get goToListPage {
    return Intl.message(
      'Go to list page',
      name: 'goToListPage',
      desc: '',
      args: [],
    );
  }

  /// `Opens up drawer`
  String get opensUpDrawer {
    return Intl.message(
      'Opens up drawer',
      name: 'opensUpDrawer',
      desc: '',
      args: [],
    );
  }

  /// `Toggle vibration. Current vibration is {dayPart, select, true{enabled} false{not enabled}}`
  String toggleVibrationCurrentIs(Object dayPart) {
    return Intl.message(
      'Toggle vibration. Current vibration is ${Intl.select(dayPart, {
            'true': 'enabled',
            'false': 'not enabled'
          })}',
      name: 'toggleVibrationCurrentIs',
      desc: '',
      args: [dayPart],
    );
  }

  /// `Toggle sound. Current sound is {dayPart, select, true{enabled} false{not enabled}}`
  String toggleSoundCurrentIs(Object dayPart) {
    return Intl.message(
      'Toggle sound. Current sound is ${Intl.select(dayPart, {
            'true': 'enabled',
            'false': 'not enabled'
          })}',
      name: 'toggleSoundCurrentIs',
      desc: '',
      args: [dayPart],
    );
  }

  /// `Expand button size tile. Current size is {size, select, Small{Small} Medium{Medium} Large{Large} other{Very Large}}`
  String expandButtonSizeTileCurrentIs(Object size) {
    return Intl.message(
      'Expand button size tile. Current size is ${Intl.select(size, {
            'Small': 'Small',
            'Medium': 'Medium',
            'Large': 'Large',
            'other': 'Very Large'
          })}',
      name: 'expandButtonSizeTileCurrentIs',
      desc: '',
      args: [size],
    );
  }

  /// `Vibration`
  String get vibration {
    return Intl.message(
      'Vibration',
      name: 'vibration',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Button Size`
  String get buttonSize {
    return Intl.message(
      'Button Size',
      name: 'buttonSize',
      desc: '',
      args: [],
    );
  }

  /// `{size, select, small{Small} medium{Medium} large{Large} other{Very Large}}`
  String drawerSizeItem(Object size) {
    return Intl.select(
      size,
      {
        'small': 'Small',
        'medium': 'Medium',
        'large': 'Large',
        'other': 'Very Large',
      },
      name: 'drawerSizeItem',
      desc: '',
      args: [size],
    );
  }

  /// `You have not added a dhikr yet`
  String get noItems {
    return Intl.message(
      'You have not added a dhikr yet',
      name: 'noItems',
      desc: '',
      args: [],
    );
  }

  /// `Update Dhikr`
  String get updateDhikr {
    return Intl.message(
      'Update Dhikr',
      name: 'updateDhikr',
      desc: '',
      args: [],
    );
  }

  /// `Enter Dhikr Name`
  String get enterDhikrName {
    return Intl.message(
      'Enter Dhikr Name',
      name: 'enterDhikrName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Dhikr Counter`
  String get enterDhikrCount {
    return Intl.message(
      'Enter Dhikr Counter',
      name: 'enterDhikrCount',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `dhikr counter {count} titled {title}`
  String counterBlaBla(Object count, Object title) {
    return Intl.message(
      'dhikr counter $count titled $title',
      name: 'counterBlaBla',
      desc: '',
      args: [count, title],
    );
  }

  /// `Unnamed`
  String get unnamed {
    return Intl.message(
      'Unnamed',
      name: 'unnamed',
      desc: '',
      args: [],
    );
  }

  /// `Add Dhikr`
  String get addDhikr {
    return Intl.message(
      'Add Dhikr',
      name: 'addDhikr',
      desc: '',
      args: [],
    );
  }

  /// `Enter Dhikr Name`
  String get enterZikrName {
    return Intl.message(
      'Enter Dhikr Name',
      name: 'enterZikrName',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

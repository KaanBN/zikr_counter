// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'tr';

  static String m0(count, title) => "${title} başlıklı zikir sayacı {sayı}";

  static String m1(count) => "şu anki sayaç: ${count}";

  static String m2(size) => "${Intl.select(size, {
            'small': 'Küçük',
            'medium': 'Orta',
            'large': 'Büyük',
            'other': 'Çok Büyük',
          })}";

  static String m3(size) =>
      "Düğme boyutu döşemesini genişletin. Geçerli boyut ${Intl.select(size, {
            'Small': 'küçük',
            'Medium': 'orta',
            'Large': 'büyük',
            'other': 'çok büyük',
          })}";

  static String m4(dayPart) =>
      "Sesi aç kapat. Şu an ses ${Intl.select(dayPart, {
            'true': 'etkin',
            'false': 'etkin değil',
          })}";

  static String m5(dayPart) =>
      "Titreşimi değiştir. Şu an titreşim ${Intl.select(dayPart, {
            'true': 'etkin',
            'false': 'etkin değil',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Ekle"),
        "addDhikr": MessageLookupByLibrary.simpleMessage("Zikir Ekle"),
        "buttonSize": MessageLookupByLibrary.simpleMessage("Düğme Boyu"),
        "cancel": MessageLookupByLibrary.simpleMessage("İptal"),
        "counterBlaBla": m0,
        "counterCount": m1,
        "drawerSizeItem": m2,
        "enterDhikrName":
            MessageLookupByLibrary.simpleMessage("Zikir Adını Girin"),
        "expandButtonSizeTileCurrentIs": m3,
        "goToListPage":
            MessageLookupByLibrary.simpleMessage("Liste sayfasına git"),
        "increaseCounter": MessageLookupByLibrary.simpleMessage("sayacı artır"),
        "list": MessageLookupByLibrary.simpleMessage("Liste"),
        "noItems":
            MessageLookupByLibrary.simpleMessage("Henüz bir zikir eklemediniz"),
        "opensUpDrawer":
            MessageLookupByLibrary.simpleMessage("Yan menüyü açar"),
        "resetCounter": MessageLookupByLibrary.simpleMessage("sayacı sıfırla"),
        "sound": MessageLookupByLibrary.simpleMessage("Ses"),
        "toggleSoundCurrentIs": m4,
        "toggleVibrationCurrentIs": m5,
        "unnamed": MessageLookupByLibrary.simpleMessage("İsimsiz"),
        "update": MessageLookupByLibrary.simpleMessage("Değiştir"),
        "updateDhikr": MessageLookupByLibrary.simpleMessage("Zikiri güncelle"),
        "vibration": MessageLookupByLibrary.simpleMessage("Titreşim")
      };
}

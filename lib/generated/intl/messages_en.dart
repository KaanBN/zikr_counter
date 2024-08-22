// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(count) => "{current counter is: ${count}}";

  static String m1(size) => "${Intl.select(size, {
            'small': 'Small',
            'medium': 'Medium',
            'large': 'Large',
            'other': 'Very Large',
          })}";

  static String m2(size) =>
      "Expand button size tile. Current size is ${Intl.select(size, {
            'Small': 'Small',
            'Medium': 'Medium',
            'Large': 'Large',
            'other': 'Very Large',
          })}";

  static String m3(dayPart) =>
      "Toggle sound. Current sound is ${Intl.select(dayPart, {
            'true': 'enabled',
            'false': 'not enabled',
          })}";

  static String m4(dayPart) =>
      "Toggle vibration. Current vibration is ${Intl.select(dayPart, {
            'true': 'enabled',
            'false': 'not enabled',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "buttonSize": MessageLookupByLibrary.simpleMessage("Button Size"),
        "counterCount": m0,
        "drawerSizeItem": m1,
        "expandButtonSizeTileCurrentIs": m2,
        "goToListPage": MessageLookupByLibrary.simpleMessage("Go to list page"),
        "increaseCounter":
            MessageLookupByLibrary.simpleMessage("increase counter"),
        "list": MessageLookupByLibrary.simpleMessage("List"),
        "opensUpDrawer":
            MessageLookupByLibrary.simpleMessage("Opens up drawer"),
        "resetCounter": MessageLookupByLibrary.simpleMessage("reset counter"),
        "sound": MessageLookupByLibrary.simpleMessage("Sound"),
        "toggleSoundCurrentIs": m3,
        "toggleVibrationCurrentIs": m4,
        "vibration": MessageLookupByLibrary.simpleMessage("Vibration")
      };
}

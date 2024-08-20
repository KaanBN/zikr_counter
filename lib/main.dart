import 'package:flutter/material.dart';
import 'package:zikir_sayar/pages/counter_page/CounterPage.dart';
import 'package:zikir_sayar/pages/counter_page/clippers/ZikirmatikClipper.dart';
import 'package:zikir_sayar/pages/counter_page/painters/SegmentPainter.dart';
import 'package:zikir_sayar/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: brightTheme,
      darkTheme: darkTheme,
      home: const Counterpage(),
    );
  }
}
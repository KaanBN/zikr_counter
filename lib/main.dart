import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:zikir_sayar/Notifiers/ZikrProvider.dart';
import 'package:zikir_sayar/pages/counter_page/CounterPage.dart';
import 'package:zikir_sayar/theme.dart';

import 'generated/l10n.dart';

WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

void main() {
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();

  /*runApp(
      const MyApp()
  );*/

  runApp(
    ChangeNotifierProvider(
      create: (_) => ZikrProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ZikrProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: brightTheme,
          darkTheme: darkTheme,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('tr'), // turkis
          ],
          home: const Counterpage(),
        ),
    );*/

    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: brightTheme,
      darkTheme: darkTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('tr'), // turkis
      ],
      home: const Counterpage(),
    );
  }
}
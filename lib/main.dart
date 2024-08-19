import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _resetCount() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Demo'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Custom Shape Background
            ClipPath(
              clipper: ZikirmatikClipper(),
              child: Container(
                width: 200,
                height: 300,
                color: Colors.grey[800],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sayı gösterge ekranı
                Container(
                  width: 140,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '$_count',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // sıfırlama Butonu
                ElevatedButton(
                  onPressed: _resetCount,
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), backgroundColor: Colors.grey[500],
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight
                  ),
                  child: null,
                ),
                const SizedBox(height: 20),
                // sayaç Butonu
                ElevatedButton(
                  onPressed: _incrementCount,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), backgroundColor: Colors.grey[600],
                    padding: EdgeInsets.all(40),
                  ), child: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Zikirmatik extends StatefulWidget {
  const Zikirmatik({super.key});

  @override
  State<Zikirmatik> createState() => _ZikirmatikState();
}

class _ZikirmatikState extends State<Zikirmatik> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _resetCount() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Custom Shape Background
        ClipPath(
          clipper: ZikirmatikClipper(),
          child: Container(
            width: 200,
            height: 300,
            color: Colors.grey[800],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sayı gösterge ekranı
            Container(
              width: 140,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '$_count',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // sıfırlama Butonu
            ElevatedButton(
              onPressed: _resetCount,
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), backgroundColor: Colors.grey[500],
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight
              ),
              child: null,
            ),
            const SizedBox(height: 20),
            // sayaç Butonu
            ElevatedButton(
              onPressed: _incrementCount,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(), backgroundColor: Colors.grey[600],
                padding: EdgeInsets.all(40),
              ), child: null,
            ),
          ],
        ),
      ],
    );
  }
}

class ZikirmatikClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = 30.0;

    // Dış çerçeve (yuvarlatılmış köşeler)
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ZikirmatikClipper oldClipper) => false;
}

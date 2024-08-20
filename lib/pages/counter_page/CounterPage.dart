import 'package:flutter/material.dart';

import '../../widgets/SevenSegmentDisplay.dart';
import 'clippers/ZikirmatikClipper.dart';

class Counterpage extends StatefulWidget {
  const Counterpage({super.key});

  @override
  State<Counterpage> createState() => _CounterpageState();
}

class _CounterpageState extends State<Counterpage> {
  int _count = 0;


  void _incrementCount() {
    setState(() {
      if(_count < 9999) {
        _count++;
      } else {
        _count = 0;
      }
    });
  }

  void _resetCount() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Demo'),
      ),
      body: Center(
        child: SizedBox(
          width: deviceWidth / 1.2,
          height: deviceHeight / 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Custom Shape Background
              ClipPath(
                clipper: ZikirmatikClipper(),
                child: Container(
                  color: Colors.grey[800],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    color: Colors.amber,
                    child: SevenSegmentDisplay(
                        value: _count,
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
      ),
    );
  }
}

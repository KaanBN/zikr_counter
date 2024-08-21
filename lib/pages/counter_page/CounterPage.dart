import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/SevenSegmentDisplay.dart';

class Counterpage extends StatefulWidget {
  const Counterpage({super.key});

  @override
  State<Counterpage> createState() => _CounterpageState();
}

class _CounterpageState extends State<Counterpage> {
  int _counter = 0;
  bool _vibrationEnabled = true;
  bool _soundEnabled = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_vibrationEnabled) {
        HapticFeedback.vibrate();
      }
      if (_soundEnabled) {
        SystemSound.play(SystemSoundType.click);
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _toggleVibration() {
    setState(() {
      _vibrationEnabled =!_vibrationEnabled;
    });
  }

  void _toggleSound() {
    setState(() {
      _soundEnabled =!_soundEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    // Define the SVG size as a fraction of the device dimensions
    double svgWidth = deviceWidth * 0.8; // 80% of device width
    double svgHeight = deviceHeight * 0.5; // Maintain aspect ratio (adjust as needed)

    // Calculate dynamic sizes based on device dimensions
    double buttonSize = deviceWidth * 0.2; // 20% of device width
    double smallButtonSize = deviceWidth * 0.1; // 10% of device width
    double fontSize = deviceWidth * 0.08; // 8% of device width

    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          // Centered Container for SVG with Aspect Ratio
          Center(
            child: SizedBox(
              width: svgWidth,
              height: svgHeight,
              child: SvgPicture.asset(
                'assets/images/asd2.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Content
          Center(
            child: SizedBox(
              width: svgWidth * 0.55,
              height: svgHeight * 0.75,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Counter Display at the Center
                    Center(
                      child: Container(
                        color: Colors.greenAccent,
                        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                          child: SevenSegmentDisplay(value: _counter)
                      ),
                    ),
                    SizedBox(height: deviceHeight * 0.02), // Space between counter and buttons
                    // Row for the Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: _resetCounter,
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(smallButtonSize / 4), // Adjust size dynamically
                            backgroundColor: Colors.redAccent,
                          ),
                          child: Icon(Icons.refresh, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.02), // Space between small buttons and big button
                    // Large Button at Bottom Center
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _incrementCounter();
                          HapticFeedback.vibrate();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.all(buttonSize * 0.6), // Adjust size dynamically
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: null
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Button 1
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),// Adjust size dynamically
                backgroundColor: Colors.blueAccent,
              ),
              child: Icon(Icons.add, color: Colors.white, size: buttonSize / 3),
            ),
            // Button 2
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                backgroundColor: Colors.blueAccent,
              ),
              child: Icon(Icons.add, color: Colors.white, size: buttonSize / 3),
            ),
            // Button 3
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                backgroundColor: Colors.blueAccent,
              ),
              child: Icon(Icons.add, color: Colors.white, size: buttonSize / 3),
            ),
            // Button 4
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                backgroundColor: Colors.blueAccent,
              ),
              child: Icon(Icons.add, color: Colors.white, size: buttonSize / 3),
            ),
          ],
        ),
      ),
    );
  }
}

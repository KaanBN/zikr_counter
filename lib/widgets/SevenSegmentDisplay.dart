import 'package:flutter/material.dart';

import 'Segment.dart';

class SevenSegmentDisplay extends StatelessWidget {
  final int value;

  const SevenSegmentDisplay({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    String valueStr = value.toString().padLeft(4, '0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: valueStr.split('').map((digit) {
        return Container(
          width: 30,
          height: 50,
          margin: EdgeInsets.all(4),
          child: Segment(digit: digit),
        );
      }).toList(),
    );
  }
}
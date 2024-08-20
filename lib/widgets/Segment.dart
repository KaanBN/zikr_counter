import 'package:flutter/material.dart';

import '../pages/counter_page/painters/SegmentPainter.dart';

class Segment extends StatelessWidget {
  final String digit;

  const Segment({super.key, required this.digit});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: SegmentPainter(digit),
    );
  }
}

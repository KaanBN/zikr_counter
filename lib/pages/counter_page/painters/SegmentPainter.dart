import 'package:flutter/material.dart';

class SegmentPainter extends CustomPainter {
  final String digit;

  SegmentPainter(this.digit);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint activePaint = Paint()
      ..color = const Color(0xff000000)
      ..style = PaintingStyle.fill;

    final Paint inactivePaint = Paint()
      ..color = const Color(0x35000000)
      ..style = PaintingStyle.fill;

    // Ensure width and height are greater than zero
    final double width = size.width;
    final double height = size.height;
    if (width <= 0 || height <= 0) return;

    // Define segment dimensions as proportions of widget size
    final double segmentWidth = width * 0.2;
    final double segmentHeight = height * 0.12;

    final double gap = 1;

    // Define the top segment shape
    Path _top = Path()
      ..moveTo(gap, 0)
      ..lineTo(width - gap, 0)
      ..lineTo(width - gap - segmentWidth, segmentHeight)
      ..lineTo(segmentWidth + gap, segmentHeight)
      ..close();

    Path _topRight = Path()
      ..moveTo(width - segmentWidth, segmentHeight + gap)
      ..lineTo(width, gap)
      ..lineTo(width, height / 2 - gap)
      ..lineTo(width - segmentWidth, height / 2  - gap - segmentHeight + (segmentHeight / 2))
      ..close();

    Path _bottomRight = Path()
      ..moveTo(width - segmentWidth, height / 2 + segmentHeight - (segmentHeight / 2) + gap)
      ..lineTo(width, height / 2 + gap)
      ..lineTo(width, height - gap)
      ..lineTo(width - segmentWidth, height - segmentHeight - gap)
      ..close();

    Path _bottom = Path()
      ..moveTo(segmentWidth + gap, height - segmentHeight)
      ..lineTo(width - segmentWidth - gap, height - segmentHeight)
      ..lineTo(width - gap, height)
      ..lineTo(gap, height)
      ..close();

    Path _bottomLeft = Path()
      ..moveTo(0, height / 2 + gap)
      ..lineTo(segmentWidth, height / 2 + segmentHeight - (segmentHeight / 2) + gap)
      ..lineTo(segmentWidth, height - segmentHeight - gap)
      ..lineTo(0, height - gap)
      ..close();

    Path _topLeft = Path()
      ..moveTo(0, gap)
      ..lineTo(segmentWidth, segmentWidth + gap)
      ..lineTo(segmentWidth, height / 2 - segmentHeight + (segmentHeight / 2) - gap)
      ..lineTo(0, height / 2 - gap)
      ..close();

    Path _middle = Path()
      ..moveTo(segmentWidth + gap, height / 2 - segmentHeight / 2)
      ..lineTo(width - segmentWidth - gap, height / 2 - segmentHeight / 2)
      ..lineTo(width - gap, height / 2)
      ..lineTo(width - segmentWidth - gap, height / 2 + segmentHeight / 2)
      ..lineTo(segmentWidth + gap, height / 2 + segmentHeight / 2)
      ..lineTo(segmentWidth - segmentWidth + gap, height / 2)
      ..close();

    // Map digit to active segments
    Map<String, List<Path>> segments = {
      '0': [_top, _topRight, _bottomRight, _bottom, _bottomLeft, _topLeft],
      '1': [_topRight, _bottomRight],
      '2': [_top, _topRight, _middle, _bottomLeft, _bottom],
      '3': [_top, _topRight, _middle, _bottomRight, _bottom],
      '4': [_topLeft, _topRight, _middle, _bottomRight],
      '5': [_top, _topLeft, _middle, _bottomRight, _bottom],
      '6': [_top, _topLeft, _middle, _bottomRight, _bottom, _bottomLeft],
      '7': [_top, _topRight, _bottomRight],
      '8': [_top, _topRight, _middle, _bottomRight, _bottom, _bottomLeft, _topLeft],
      '9': [_top, _topRight, _middle, _bottomRight, _bottom, _topLeft],
    };

    Set<Path> activeSegments = Set.from(segments[digit]?? []);

    // Draw all segments
    void drawAllSegments() {
      final List<Path> allSegments = [_top, _topRight, _bottomRight, _bottom, _bottomLeft, _topLeft, _middle];
      for (final segment in allSegments) {
        if (activeSegments.contains(segment)) {
          canvas.drawPath(segment, activePaint);
        } else {
          canvas.drawPath(segment, inactivePaint);
        }
      }
    }

    drawAllSegments();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
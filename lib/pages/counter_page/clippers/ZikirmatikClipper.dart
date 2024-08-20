import 'package:flutter/material.dart';

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
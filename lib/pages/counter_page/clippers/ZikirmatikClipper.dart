import 'package:flutter/material.dart';

class ZikirmatikClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height / 10); // start from top left
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height / 10); // curve to top right
    path.lineTo(size.width, size.height / 2); // line to mid right
    path.lineTo(size.width * 0.8, size.height); // line to bottom right
    path.quadraticBezierTo(size.width / 2, size.height * 0.9, size.width * 0.2, size.height); // curve to bottom left
    path.lineTo(0, size.height / 2); // line to mid left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(ZikirmatikClipper oldClipper) => false;
}
import 'package:flutter/material.dart';

Future<String> loadSvgWithColorChange(BuildContext context) async {
  String svgString = await DefaultAssetBundle.of(context).loadString('assets/images/asd2.svg');

  svgString = svgString.replaceAll('#000000', '#FF0000'); // Change black to red
  svgString = svgString.replaceAll('#FF0000', '#0000FF'); // Change red to blue

  return svgString;
}
import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(final String hexColor) : super(_fromHex(hexColor));

  static int _fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
}

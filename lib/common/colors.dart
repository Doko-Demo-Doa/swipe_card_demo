import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class CommonColors {
  static var FAWN = HexColor('#CFA781');
  static var RED_PURPLE = HexColor('#86223F');
  static var DARK = HexColor('#14191F');
  static var ALMOST_BLACK = HexColor('#03141E');
  static var DARK_BLUE = HexColor('#15243C');
  static var DARK_GREY_BLUE = HexColor('#2A4652');
  static var DARK_BLUE_GREY = HexColor('#18364E');
  static var DUSTY_ORANGE = HexColor('#F18623');
  static var LIGHT_NAVY_BLUE = HexColor('#2F6181');
  static var LIGHT_BLUE = HexColor('#6DCFF6');
  static var METALLIC_BLUE = HexColor('#4F708B');
  static var GUNMETAL = HexColor('#505A66');
  static var DIRTY_GREEN = HexColor('#5E7628');
  static var PALE_GREY = HexColor('#F9F9F9');
  static var LIGHT_GREY = HexColor('#E0E0E0');
  static var GREY = HexColor('#8B8B8B');
  static var PEA_GREEN = HexColor('#94AA0E');
  static var LIGHT_OLIVE_GREEN = HexColor('#8EB654');
  static var SUNFLOWER = HexColor('#FFC90E');
  static var CORNFLOWER = HexColor('#666EE6');
}

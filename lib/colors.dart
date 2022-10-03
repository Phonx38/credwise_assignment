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

const selectedNavbarColor = Colors.blue;
const unselectedNavbarColor = Colors.grey;
const backgroundColor = Colors.white;
const appBarColor = Colors.white;
const shadowColor = Colors.black38;
Color blueColor = HexColor('#007AFE');
Color greyColor = HexColor("#FAFAFA");

import 'package:credwise/commons/error_screen.dart';
import 'package:credwise/features/bottomnav/bottom_bar.dart';
import 'package:credwise/features/home/screens/home_screen.dart';
import 'package:credwise/features/mycards/screens/my_card_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MyCardsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const MyCardsScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (context) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}

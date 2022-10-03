import 'package:credwise/colors.dart';
import 'package:credwise/features/home/screens/home_screen.dart';
import 'package:eos_icons_flutter/eos_icons_flutter.dart';
import 'package:eos_icons_flutter/icons/solidicons.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/bottom-bar";
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        confineInSafeArea: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        screens: screens(),
        items: navBaritems(),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}

List<Widget> screens() {
  return [
    const HomeScreen(),
    const Center(
      child: Text('Friends'),
    ),
    const Center(
      child: Text('Requests'),
    ),
    const Center(
      child: Text('Cards'),
    ),
    const Center(
      child: Text('Notifications'),
    ),
  ];
}

List<PersistentBottomNavBarItem> navBaritems() {
  return [
    PersistentBottomNavBarItem(
      // routeAndNavigatorSettings:  RouteAndNavigatorSettings(onGenerateRoute: generateRoute()),
      icon: const SizedBox(
        width: 42,
        child: Icon(
          Icons.home,
        ),
      ),
      title: 'Home',
      activeColorPrimary: selectedNavbarColor,
      inactiveColorPrimary: unselectedNavbarColor,
    ),
    PersistentBottomNavBarItem(
      contentPadding: 0,
      iconSize: 20,
      icon: const SizedBox(
        width: 42,
        child: Icon(
          FontAwesome5.user_friends,
        ),
      ),
      title: 'Friends',
      activeColorPrimary: selectedNavbarColor,
      inactiveColorPrimary: unselectedNavbarColor,
    ),
    PersistentBottomNavBarItem(
      icon: const SizedBox(width: 42, child: Icon(FontAwesome5.code_branch)),
      title: 'Requests',
      activeColorPrimary: selectedNavbarColor,
      inactiveColorPrimary: unselectedNavbarColor,
    ),
    PersistentBottomNavBarItem(
      icon: const SizedBox(
        width: 42,
        child: Icon(
          MdiIcons.cards,
        ),
      ),
      title: 'Cards',
      activeColorPrimary: selectedNavbarColor,
      inactiveColorPrimary: unselectedNavbarColor,
    ),
    PersistentBottomNavBarItem(
      icon: const SizedBox(
        width: 42,
        child: Icon(
          Icons.notifications,
        ),
      ),
      title: 'Notifications',
      activeColorPrimary: selectedNavbarColor,
      inactiveColorPrimary: unselectedNavbarColor,
    ),
  ];
}

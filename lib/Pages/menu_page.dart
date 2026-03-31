import 'package:flutter/material.dart';
import 'ResponsivePages/Desktop/desktop_main_page.dart';
import 'ResponsivePages/Mobile/mobile_main_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) { return MobileMainPage(); }
      return DesktopMainPage();
    },);
  }
}
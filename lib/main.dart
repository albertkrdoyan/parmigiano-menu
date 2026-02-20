import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'Pages/MenuPage.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.15;
    appBarHeight = (h > 100 ? 100 : h < 75 ? 75 : h);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      home: MenuPage(),
    );
  }
}

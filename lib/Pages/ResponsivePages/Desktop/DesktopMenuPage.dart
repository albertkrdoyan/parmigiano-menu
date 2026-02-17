import 'package:flutter/material.dart';

class DesktopMenuPage extends StatefulWidget {
  const DesktopMenuPage({super.key});

  @override
  State<DesktopMenuPage> createState() => _DesktopMenuPageState();
}

class _DesktopMenuPageState extends State<DesktopMenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Menu Page"),
    );
  }
}

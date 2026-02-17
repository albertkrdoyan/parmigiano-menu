import 'package:flutter/material.dart';

class MobileMenuPage extends StatefulWidget {
  const MobileMenuPage({super.key});

  @override
  State<MobileMenuPage> createState() => _MobileMenuPageState();
}

class _MobileMenuPageState extends State<MobileMenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Menu Page"),
    );
  }
}

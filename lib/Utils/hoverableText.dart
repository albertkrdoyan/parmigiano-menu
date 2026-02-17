
import 'package:flutter/material.dart';
import 'package:parmigiano_menu/Utils/constants.dart';

class HoverableText extends StatefulWidget{
  const HoverableText({super.key, required this.text, required this.isActive, required this.size, required this.noAnimation});
  final String text;
  final bool isActive;
  final double size;
  final bool noAnimation;

  @override
  State<HoverableText> createState() => HoverableTextState();
}

class HoverableTextState extends State<HoverableText>{
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: widget.size,
        color: isHovered ? Colors.deepOrangeAccent : (widget.isActive ? Colors.blue : mainColor)
    );

    return MouseRegion(
      onEnter: (context) => setState(() { isHovered = true; }),
      onExit: (context) => setState(() { isHovered = false; }),
      child: AnimatedContainer(
        duration: widget.noAnimation ? const Duration(milliseconds: 0) : const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: widget.noAnimation ? null : isHovered ? (Matrix4.identity()..scale(1.1)..translate(-1.0, -5.0)) : Matrix4.identity(),
        child: Text(widget.text, style: style),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:parmigiano_menu/Utils/constants.dart';

class HoverableText extends StatefulWidget{
  const HoverableText({super.key, required this.text, required this.isActive, required this.size, required this.noAnimation, required this.activeColor, required this.hasUnderline});
  final String text;
  final bool isActive;
  final bool hasUnderline;
  final double size;
  final bool noAnimation;
  final Color activeColor;

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
        color: isHovered ? Colors.deepOrangeAccent : (widget.isActive ? (widget.activeColor == Colors.transparent ? Colors.blue : widget.activeColor) : mainColor)
    );

    if (widget.isActive && widget.hasUnderline){
      locations.add(locations.last + widget.text.length.toDouble() * 15 * widget.size / 25);
    }

    return MouseRegion(
      onEnter: (context) => setState(() { isHovered = true; }),
      onExit: (context) => setState(() { isHovered = false; }),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: widget.noAnimation ? const Duration(milliseconds: 0) : const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: widget.noAnimation ? null : isHovered ? (Matrix4.identity()..scale(1.1)..translate(-1.0, -5.0)) : Matrix4.identity(),
            child: Text(widget.text, style: style,),
          ),
          if (widget.hasUnderline)...[
            if (widget.isActive)...[
              SizedBox(height: 15,),
            ],
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 3,
              width: widget.isActive && widget.hasUnderline ? widget.text.length.toDouble() * 15 * widget.size / 25 : 0,
              color: parmigianoGoldColor,
            )
          ],
        ],
      ),
    );
  }
}
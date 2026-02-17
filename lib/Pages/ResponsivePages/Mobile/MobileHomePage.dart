import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key, required this.size, required this.refresh});
  final Size size;
  final VoidCallback refresh;

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: widget.size.height - appBarHeight, maxWidth: widget.size.width),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 45,),
                Text(
                  mainPageTitleText,
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: parmigianoGoldColor
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.2),
                  child: Text(
                      mainPageInfoText,
                      style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFDCD8D0)
                      ),
                      textAlign: TextAlign.center
                  ),
                ),
                SizedBox(height: widget.size.height * 0.1,),
                ElevatedButton(
                  onPressed: widget.refresh,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(parmigianoGoldColor),
                  ),
                  child: SizedBox(
                    width: widget.size.width * 0.85,
                    height: widget.size.height * 0.1,
                    child: Center(
                      child: HoverableText(
                        text: "See Menu.",
                        isActive: true,
                        size: 32,
                        noAnimation: true,
                      )
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key, required this.size, required this.refresh});
  final size;
  final VoidCallback refresh;

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
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
                SizedBox(height: 100,),
                Text(
                  mainPageTitleText,
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 65,
                      fontWeight: FontWeight.w700,
                      color: parmigianoGoldColor
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.2),
                  child: Text(
                      mainPageInfoText,
                      style: GoogleFonts.lato(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFDCD8D0)
                      ),
                      textAlign: TextAlign.center
                  ),
                ),
                SizedBox(height: widget.size.height * 0.15,),
                ElevatedButton(
                  onPressed: widget.refresh,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(parmigianoGoldColor),
                  ),
                  child: SizedBox(
                    width: widget.size.width * 0.25,
                    height: widget.size.height * 0.1,
                    child: Center(
                      child: HoverableText(
                        text: "See Menu",
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

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
    double interval = widget.size.height * 0.05;
    double width = widget.size.width, height = widget.size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height, maxWidth: width),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05,),
              TweenAnimationBuilder(
                tween: Tween(begin: 0, end: interval),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsetsGeometry.only(top: interval - value),
                    child: Opacity(
                      opacity: value / interval,
                      child: child,
                    ),
                  );
                },
                child: SizedBox(
                  width: width * 0.9,
                  child: Text(
                    mainPageTitleText,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: width * 0.095,
                        fontWeight: FontWeight.w700,
                        color: parmigianoGoldColor
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: height * 0.035,),
              TweenAnimationBuilder(
                tween: Tween(begin: 0, end: interval),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value / interval,
                    child: child,
                  );
                },
                child: SizedBox(
                  width: width * 0.6,
                  child: Text(
                      mainPageInfoText,
                      style: GoogleFonts.lato(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFDCD8D0)
                      ),
                      textAlign: TextAlign.center
                  ),
                ),
              ),
              SizedBox(height: height * 0.095,),
              TweenAnimationBuilder(
                tween: Tween(begin: 0, end: interval),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value / interval,
                    child: child,
                  );
                },
                child: ElevatedButton(
                  onPressed: widget.refresh,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(parmigianoGoldColor),
                  ),
                  child: SizedBox(
                    width: width * 0.85,
                    height: height * 0.1,
                    child: Center(
                      child: HoverableText(
                        text: "See Menu",
                        isActive: true,
                        size: width * 0.0975,
                        noAnimation: true,
                        activeColor: Colors.transparent,
                        hasUnderline: false,
                      )
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

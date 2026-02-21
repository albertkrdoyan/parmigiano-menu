import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key, required this.size, required this.refresh});
  final Size size;
  final VoidCallback refresh;

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    double interval = widget.size.width * 0.30;
    double width = widget.size.width, height = widget.size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height - appBarHeight, maxWidth: width),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1,),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween<double>(begin: 0, end: interval),
                builder: (context, value, child) {
                  double opacity = value / interval;
                  double padding = interval - value;
                  return Opacity(
                    opacity: opacity > 1 ? 1 : opacity,
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(right: padding < 0 ? 0 : padding),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  mainPageTitleText,
                  style: GoogleFonts.playfairDisplay(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w700,
                      color: parmigianoGoldColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height * 0.025,),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween<double>(begin: 0, end: interval),
                builder: (context, value, child) {
                  double opacity = value / interval;
                  double padding = interval - value;
                  return Opacity(
                    opacity: opacity > 1 ? 1 : opacity,
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: (padding < 0 ? 0 : padding)/2),
                      child: child,
                    ),
                  );
                },
                child: SizedBox(
                  width: width * 0.6,
                  child: Text(
                    mainPageInfoText,
                    style: GoogleFonts.lato(
                      fontSize: width * 0.02,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFDCD8D0)
                    ),
                    textAlign: TextAlign.center
                  ),
                ),
              ),
              SizedBox(height: height * 0.1,),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween<double>(begin: 0, end: interval),
                builder: (context, value, child) {
                  double opacity = value / interval;
                  return Opacity(
                    opacity: opacity > 1 ? 1 : opacity,
                    child: child,
                  );
                },
                child: ElevatedButton(
                  onPressed: widget.refresh,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(parmigianoGoldColor),
                  ),
                  child: SizedBox(
                    width: width * 0.25,
                    height: width * 0.06,
                    child: Center(
                      child: HoverableText(
                        text: "See Menu",
                        isActive: true,
                        size: width * 0.03,
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

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:parmigiano_menu/Pages/ResponsivePages/Desktop/DesktopHomePage.dart';
import 'package:parmigiano_menu/Pages/ResponsivePages/Desktop/DesktopMenuPage.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';

class DesktopMainPage extends StatefulWidget{
  const DesktopMainPage({super.key});

  @override
  State<StatefulWidget> createState() => _StateDesktopMainPage();
}

class _StateDesktopMainPage extends State<DesktopMainPage>{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            toolbarHeight: appBarHeight,
            backgroundColor: Colors.black,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Container(
                    height: appBarHeight,
                    padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                    // width: 300,
                    child: Image.asset(
                      'lib/Images/Logos/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Restaurant\n      & Cafe",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(width: 85),

                  for (int i = 0; i < pages.length; ++i) ...[
                    GestureDetector(
                      onTap: () => setState(() {
                        currentPageIndex = i;
                      }),
                      child: HoverableText(
                        text: pages[i],
                        isActive: i == currentPageIndex,
                        size: 25,
                        noAnimation: false,
                        activeColor: Colors.transparent,
                        hasUnderline: false,
                      ),
                    ),
                    SizedBox(width: 45),
                  ],
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: [
                // bg image
                Positioned.fill(
                  child: Image.asset(
                    'lib/Images/BGImages/DesktopScreenBG.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Dark overlay
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.85),
                  ),
                ),
                // Your page content goes here

                if (currentPageIndex == 1)...[
                  DesktopMenuPage()
                ]
                else...[
                  DesktopHomePage(
                    size: size,
                    refresh: () => setState(() {
                      currentPageIndex = 1;
                    }),
                  )
                ]
              ],
            ),
          )
        ],
      )
    );
  }
}
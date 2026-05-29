import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parmigiano_menu/Pages/ResponsivePages/Mobile/mobile_home_page.dart';
import 'package:parmigiano_menu/Pages/ResponsivePages/Mobile/mobile_menu_page.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';
import 'package:parmigiano_menu/Utils/languageSelector.dart';

class MobileMainPage extends ConsumerStatefulWidget {
  const MobileMainPage({super.key});

  @override
  ConsumerState<MobileMainPage> createState() => _MobileMainPageState();
}

class _MobileMainPageState extends ConsumerState<MobileMainPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    currentSubMenuIndex = 0;

    return Scaffold(
      drawer: Drawer(
        width: size.width * 0.8,
        backgroundColor: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: appBarHeight,
                padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                child: Image.asset(
                  'lib/Images/Logos/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Container(
                  width: size.width * 0.7,
                  height: 1,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 35),

              for (int i = 0; i < pages.length; ++i) ...[
                GestureDetector(
                  onTap: () => setState(() {
                    currentPageIndex = i;
                    Navigator.of(context).pop();
                  }),
                  child: HoverableText(
                    text: pages[i],
                    isActive: i == currentPageIndex,
                    size: 45,
                    noAnimation: false,
                    activeColor: Colors.transparent,
                    hasUnderline: false,
                  ),
                ),
                SizedBox(height: 45),
              ],
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            toolbarHeight: appBarHeight * size.width / 450,
            backgroundColor: Colors.black,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  color: parmigianoGoldColor,
                  size: appBarHeight * 0.375,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    height: appBarHeight,
                    padding: EdgeInsetsGeometry.symmetric(vertical: 8),
                    child: Image.asset(
                      'lib/Images/Logos/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                // language
                LanguageSelector(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  // bg image
                  Positioned.fill(
                    child: Image.asset(
                      'lib/Images/BGImages/MobileScreenBG.webp',
                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  // Dark overlay
                  Positioned.fill(
                    child: Container(color: Colors.black.withOpacity(0.85)),
                  ),

                  // Your page content goes here
                  if (currentPageIndex == 1) ...[
                    MobileMenuPage(),
                  ] else ...[
                    MobileHomePage(
                      refresh: () => setState(() {
                        currentPageIndex = 1;
                      }),
                      size: size,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

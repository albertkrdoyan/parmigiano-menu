import 'package:flutter/material.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';
import 'package:parmigiano_menu/Utils/menuItemCard.dart';

class MobileMenuPage extends StatefulWidget {
  const MobileMenuPage({super.key});

  @override
  State<MobileMenuPage> createState() => _MobileMenuPageState();
}

class _MobileMenuPageState extends State<MobileMenuPage> {
  @override
  Widget build(BuildContext context) {
    String url = 'https://pub-8d9b22e7eae042c0a88908f3d798b6bb.r2.dev/Պարմիջանո';
    String sub = subMenu[currentSubMenuIndex];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final int crossAxisCount = width > 1200 ? 3 : width > 800 ? 2 : 1;
    double interval = 15;

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          // submenu
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: interval),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                debugPrint(value.toString());
                return Padding(
                  padding: EdgeInsets.only(top: value),
                  child: SizedBox(
                    // height: 110 * value,
                    child: Opacity(
                        opacity: value / interval,
                        child: child
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsetsGeometry.only(bottom: interval),
                height: 75,
                width: width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(50),
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < subMenu.length; ++i)...[
                        Container(
                          margin: EdgeInsetsGeometry.symmetric(horizontal: 7),
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // color: Colors.red
                          ),
                          child: InkWell(
                            onTap: () => setState(() {
                              currentSubMenuIndex = i;
                            }),
                            child: HoverableText(
                              text: subMenu[i],
                              isActive: i == currentSubMenuIndex,
                              size: 18,
                              noAnimation: true,
                              activeColor: Colors.green,
                              hasUnderline: true,
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ),
          // underline
          Center(
            child: Container(
              width: width * 0.9,
              height: 2,
              color: parmigianoGoldColor,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: width * 0.85,
              child: GridView.builder(
                itemCount: menu[sub]?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 1.5,
                ),
                // itemBuilder: (context, index) => Text('$sub \n$url/$sub/${menu[sub]![index][0]}${menu[sub]![index][4]}',style: TextStyle(color: Colors.white),),
                itemBuilder: (context, index) => MenuItemCard(
                  isMobile: true,
                  url: url,
                  subMenu: sub,
                  index: index,
                  crossAxisCount: crossAxisCount,
                )
              ),
            )
          )
        ],
      ),
    );
  }
}

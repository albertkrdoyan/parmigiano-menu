import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';

class DesktopMenuPage extends StatefulWidget {
  const DesktopMenuPage({super.key});

  @override
  State<DesktopMenuPage> createState() => _DesktopMenuPageState();
}

class _DesktopMenuPageState extends State<DesktopMenuPage> {
  @override
  Widget build(BuildContext context) {
    String url = 'https://pub-8d9b22e7eae042c0a88908f3d798b6bb.r2.dev/Պարմիջանո';
    String sub = subMenu[currentSubMenuIndex];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final int crossAxisCount = width > 1200 ? 3 : width > 800 ? 2 : 1;
    double interval = 15;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
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
                  height: 85,
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
                            margin: EdgeInsetsGeometry.symmetric(horizontal: 10),
                            padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 5),
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
                                size: 25,
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
      ),
    );
  }
}

class MenuItemCard extends StatefulWidget {
  const MenuItemCard({super.key, required this.url, required this.subMenu, required this.index, required this.crossAxisCount});
  final String subMenu, url;
  final int index;
  final int crossAxisCount;

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final c = widget.crossAxisCount;
    final subCardWidth = width * 0.78 / c - (c - 1) * 75 / c;

    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isHovered ? 1.05 : 1,
        child: Container(
          margin: EdgeInsetsGeometry.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                parmigianoGoldColor,
                Colors.orange
              ],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomLeft,
            )
          ),
          child: Stack(
            fit: StackFit.passthrough,
            children:
            [
              MouseRegion(
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    // image
                    if (menu[widget.subMenu]![widget.index][4] != "")...[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            Uri.encodeFull(
                              '${widget.url}/${widget.subMenu}/${menu[widget.subMenu]![widget.index][0]}.webp',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    // name
                    Positioned(
                      bottom: isHovered ? 55 : 15,
                      left: 15,
                      child: Container(
                        width: subCardWidth * 0.69,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withAlpha(125),
                                Colors.grey.withAlpha(185)
                              ],
                              begin: AlignmentGeometry.centerLeft,
                              end: AlignmentGeometry.centerRight,
                            )
                        ),
                        padding: EdgeInsetsGeometry.symmetric(vertical: 2, horizontal: 4),
                        child: Text(
                          menu[widget.subMenu]![widget.index][0],
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    // weight
                    if (isHovered)...[
                      Positioned(
                        bottom: 15,
                        left: 15,
                        child: Container(
                          width: subCardWidth * 0.69,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withAlpha(125),
                                  Colors.grey.withAlpha(185)
                                ],
                                begin: AlignmentGeometry.centerLeft,
                                end: AlignmentGeometry.centerRight,
                              )
                          ),
                          padding: EdgeInsetsGeometry.symmetric(vertical: 2, horizontal: 4),
                          child: Text(
                            menu[widget.subMenu]![widget.index][1],
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                    // price
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: Container(
                        width: subCardWidth * 0.29,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withAlpha(125),
                                Colors.grey.withAlpha(185)
                              ],
                              begin: AlignmentGeometry.centerLeft,
                              end: AlignmentGeometry.centerRight,
                            )
                        ),
                        padding: EdgeInsetsGeometry.symmetric(vertical: 2, horizontal: 4),
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${menu[widget.subMenu]![widget.index][2]} ֏',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:parmigiano_menu/Utils/constants.dart';

class MenuItemCard extends StatefulWidget {
  const MenuItemCard({super.key, required this.url, required this.subMenu, required this.index, required this.crossAxisCount, required this.isMobile});
  final String subMenu, url;
  final int index;
  final int crossAxisCount;
  final bool isMobile;

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    final c = widget.crossAxisCount;
    final subCardWidth = width * (widget.isMobile ? 0.68 : 0.78) / c - (c - 1) * 75 / c;

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
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      bottom: isHovered ? 55 : 15,
                      left: 15,
                      child: Container(
                        width: subCardWidth * 0.68,
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
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 200),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, value, child) => Transform.scale(
                            scale: value,
                            child: child,
                          ),
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
                      ),
                    ],
                    // price
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      bottom: !isHovered ? 15 : 55/1.5,
                      right: 15,
                      child: Container(
                        width: subCardWidth * 0.30,
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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parmigiano_menu/Providers/menu_data_provider.dart';
import 'package:parmigiano_menu/Utils/constants.dart';
import 'package:parmigiano_menu/Utils/hoverableText.dart';
import 'package:parmigiano_menu/Utils/menuItemCard.dart';

class DesktopMenuPage extends ConsumerStatefulWidget {
  const DesktopMenuPage({super.key});

  @override
  ConsumerState<DesktopMenuPage> createState() => _DesktopMenuPageState();
}

class _DesktopMenuPageState extends ConsumerState<DesktopMenuPage> {
  late ScrollController _scrollController, _scrollSubMenuController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollSubMenuController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollSubMenuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url =
        'https://pub-8d9b22e7eae042c0a88908f3d798b6bb.r2.dev/Պարմիջանո';
    final subRead = ref.watch(subMenuProvider);
    String sub = subRead[currentSubMenuIndex];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final int crossAxisCount = width > 1200
        ? 3
        : width > 700
        ? 2
        : 1;
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
                return Padding(
                  padding: EdgeInsets.only(top: value),
                  child: SizedBox(
                    // height: 110 * value,
                    child: Opacity(opacity: value / interval, child: child),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsetsGeometry.only(bottom: interval),
                height: 85,
                width: width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withAlpha(50),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: ListView(
                    controller: _scrollSubMenuController,
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0; i < subRead.length; ++i) ...[
                        Container(
                          margin: EdgeInsetsGeometry.symmetric(horizontal: 10),
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // color: Colors.red
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                currentSubMenuIndex = i;
                              });
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                            child: HoverableText(
                              text: subRead[i],
                              isActive: i == currentSubMenuIndex,
                              size: 25,
                              noAnimation: true,
                              activeColor: Colors.green,
                              hasUnderline: true,
                            ),
                          ),
                        ),
                      ],
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
          Consumer(
            builder: (context, ref, child) {
              return Expanded(
                child: SizedBox(
                  width: width * 0.85,
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: ref.watch(menuProvider)[sub]?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                      childAspectRatio: 1.5,
                    ),
                    // itemBuilder: (context, index) => Text(ref.read(menuProvider)[sub].toString()),
                    itemBuilder: (context, index) => MenuItemCard(
                      isMobile: false,
                      url: url + ref.read(menuProvider)[sub]![index][4],
                      subMenu: sub,
                      index: index,
                      crossAxisCount: crossAxisCount,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

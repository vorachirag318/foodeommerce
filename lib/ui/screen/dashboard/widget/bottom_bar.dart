import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';

class BottomBar extends StatefulWidget {
  final void Function(int) onTap;
  final int initialIndex;

  const BottomBar({Key? key, required this.onTap, required this.initialIndex})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int get selectedIndex => widget.initialIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 10,
      unselectedFontSize: 10,
      currentIndex: widget.initialIndex,
      unselectedItemColor: AppColor.kGreyColor,
      selectedItemColor: AppColor.kPrimaryBlue,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index < 2) {
          widget.onTap(index);
        } else if (index == 2) {
        } else if (index == 3) {}
      },
      items: [
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                  child: Image.asset(
                      selectedIndex == 0
                          ? AppAssets.homeSelected
                          : AppAssets.homeUnselected,
                      height: 23)),
            ),
            label: "home".tr.toUpperCase()),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                  selectedIndex == 1
                      ? AppAssets.searchSelected
                      : AppAssets.searchUnSelected,
                  height: 23),
            ),
            label: "search".tr.toUpperCase()),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(AppAssets.transportUnSelected, height: 23),
            ),
            label: "delivery".tr.toUpperCase()),
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(AppAssets.bagUnSelected, height: 23),
            ),
            label: "order".tr.toUpperCase()),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/ui/screen/dashboard/widget/bottom_bar.dart';
import 'package:gharoghari/ui/screen/home/home_tab.dart';
import 'package:gharoghari/ui/screen/search/search_tab.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = '/dashBoardScreen';

  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  PageController pageController = PageController();
  final StreamController<int> _bottomTabChange = StreamController.broadcast();

  Stream<int> get bottomTabChange => _bottomTabChange.stream;

  @override
  void dispose() {
    _bottomTabChange.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (index) {
            _bottomTabChange.add(index);
          },
          children: [
            HomeTab(),
            SearchTab(),
            SizedBox(),
            SizedBox(),
          ],
          controller: pageController,
        ),
        bottomNavigationBar: BottomAppBar(
          child: StreamBuilder(
            stream: bottomTabChange,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return BottomBar(
                onTap: (int index) {
                  pageController.jumpToPage(index);
                },
                initialIndex: snapshot.data ?? 0,
              );
            },
          ),
        ));
  }
}

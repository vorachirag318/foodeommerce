import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/home/widget/item_box.dart';

import '../../../core/const/app_colors.dart';

class FavouriteItemScreen extends StatefulWidget {
  static const String routeName = '/favouriteItemScreen';

  const FavouriteItemScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteItemScreen> createState() => _FavouriteItemScreenState();
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "add_recipe_details".tr,
          style: TextStyle(color: AppColor.kPrimaryBlue),
        ),
        leading: IconButton(
          iconSize: 45,
          icon: Image.asset(
            AppAssets.backButton,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        children: [
          getTitle("today".tr),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) => ItemBox()),
            ),
          ),
          SizedBox(height: 10),
          getTitle("yesterday".tr),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) => ItemBox()),
            ),
          ),
          getTitle("last_week".tr),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) => ItemBox()),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitle(String text) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: AppColor.kPrimaryTextColor),
      ),
    );
  }
}

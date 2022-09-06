import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/cook_profile/add_recipe_screen.dart';
import 'package:gharoghari/ui/screen/favourite/favourite_item_screen.dart';
import 'package:gharoghari/ui/screen/home/home_tab.dart';
import 'package:gharoghari/ui/screen/home/widget/item_box.dart';
import 'package:gharoghari/ui/screen/order_history/order_history_screen.dart';
import 'package:gharoghari/ui/screen/profile/widget/edit_profile_screen.dart';
import 'package:gharoghari/ui/screen/profile/widget/profile_tool_tile.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profileScreen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xffDEE7EE), width: 3))),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSettings.kDefaultPadding, vertical: 17),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 19,
                        backgroundImage:
                            AssetImage("assets/dummy/Rectangle 9.png"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, Heny",
                            style: TextStyle(
                                color: AppColor.kPrimaryBlue,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "1234567890 / Henyadam123@gmail.com",
                            style: TextStyle(
                                color: AppColor.kGreyColor, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    SizedBox(height: 10),
                    ProfileToolTile(
                      icon: AppAssets.profile,
                      des: "manage_your_profile".tr,
                      title: "profile".tr,
                      onTap: () {
                        Get.toNamed(EditProfileScreen.routeName);
                      },
                    ),
                    ProfileToolTile(
                      icon: AppAssets.homeAddress,
                      des: "edit_your_location".tr,
                      title: "mange_address".tr,
                      onTap: () {},
                    ),
                    ProfileToolTile(
                      icon: AppAssets.cook,
                      des: "register_as_cook".tr,
                      title: "cook_profile".tr,
                      onTap: () {
                        Get.toNamed(AddRecipeScreen.routeName);
                      },
                    ),
                    ProfileToolTile(
                      icon: AppAssets.like,
                      des: "your_favourites_recipe".tr,
                      title: "favourites".tr,
                      onTap: () {
                        Get.toNamed(FavouriteItemScreen.routeName);
                      },
                    ),
                    ProfileToolTile(
                      icon: AppAssets.tag,
                      des: "new_available_offers".tr,
                      title: "offers".tr,
                    ),
                    ProfileToolTile(
                      icon: AppAssets.payments,
                      des: "change_and_add".tr,
                      title: "payment_methods".tr,
                    ),
                    SizedBox(height: 20),
                    divider(),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSettings.kDefaultPadding),
                      child: ScreenCategoryTitle(
                        text: "your_past_order".tr,
                        showMore: false,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => GestureDetector(
                                onTap: () {
                                  Get.toNamed(OrderHistoryScreen.routeName);
                                },
                                child: ItemBox())),
                      ),
                    ),
                    SizedBox(height: 50)
                  ],
                ))
              ],
            ),
            Positioned(
              bottom: 10,
              right: AppSettings.kDefaultPadding,
              left: AppSettings.kDefaultPadding,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                      )
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSettings.kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "logout".tr,
                        style: TextStyle(color: AppColor.kPrimaryBlue),
                      ),
                      Image.asset(
                        AppAssets.logout,
                        height: 21,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container divider() {
    return Container(
      height: 3,
      width: double.infinity,
      color: Color(0xffDEE7EE),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/onboarding/onboarding.dart';

class RecipePageScreen extends StatefulWidget {
  static const String routeName = '/recipePageScreen';

  const RecipePageScreen({Key? key}) : super(key: key);

  @override
  State<RecipePageScreen> createState() => _RecipePageScreenState();
}

class _RecipePageScreenState extends State<RecipePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "register".tr,
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
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
            child: Row(
              children: [
                Stack(
                  children: [
                    DottedBorder(
                      borderType: BorderType.Circle,
                      padding: EdgeInsets.all(6),
                      dashPattern: [4],
                      color: AppColor.kPrimaryTextColor,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/dummy/Rectangle 9.png")),
                            border: Border.all(color: AppColor.kPrimaryBlue)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                                color: AppColor.kPrimaryBlue, width: 1.4)),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          color: AppColor.kPrimaryBlue,
                          size: 14,
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Hello, heny",
                  style: TextStyle(
                      color: AppColor.kPrimaryBlue,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset(
                  AppAssets.editName,
                  height: 22,
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Stack(
            children: [
              InnerShadow(
                color: AppColor.kPrimaryTextColor.withOpacity(0.10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(children: [
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSettings.kDefaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black12,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black12,
                                )
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/dummy/Mask group.png"))),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSettings.kDefaultPadding),
                          child: Row(
                            children: [
                              Text(
                                "Dal Chawal",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "edit_details".tr,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: AppColor.kPrimaryBlue,
                                        decoration: TextDecoration.underline),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSettings.kDefaultPadding),
                    child: DottedBorder(
                        dashPattern: [3],
                        borderType: BorderType.RRect,
                        color: AppColor.kPrimaryTextColor,
                        radius: Radius.circular(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 160,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppAssets.attachment,
                                  height: 28,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "upload_recipe_photo".tr,
                                  style: TextStyle(
                                      color: AppColor.kPrimaryTextColor),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ]),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/cook_profile/register_recipe_screen.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';

class AddRecipeScreen extends StatefulWidget {
  static const String routeName = '/addRecipeScreen';

  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.recipeTitleImage),
          SizedBox(height: 20),
          Text(
            "recipe_add_des".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xff4E85B5),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "register_as_cook".tr,
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.kGreyColor, fontSize: 15),
          ),
          SizedBox(height: 30),
          CustomButton(
              padding: AppSettings.kDefaultPadding,
              type: CustomButtonType.colourBlueButton,
              text: "register_here".tr,
              onTap: () {
                Get.toNamed(RegisterRecipeScreen.routeName);
              }),
          SizedBox(height: 10),
          CustomButton(
              padding: AppSettings.kDefaultPadding,
              type: CustomButtonType.borderButton,
              text: "cancel".tr,
              onTap: () {
                Get.back();
              }),
        ],
      ),
    );
  }
}

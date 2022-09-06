import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/cook_profile/controller/register_recipe_detail_controller.dart';
import 'package:gharoghari/ui/screen/cook_profile/recipe_page_screen.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/custom_textfield.dart';

import '../../../core/const/app_colors.dart';

enum FoodVegType { veg, nonVeg }

enum WeekDayName { sun, mon, tue, wed, thur, fri, sat }

class RegisterRecipeDetailScreen extends StatefulWidget {
  static const String routeName = '/registerRecipeDetailScreen';

  const RegisterRecipeDetailScreen({Key? key}) : super(key: key);

  @override
  State<RegisterRecipeDetailScreen> createState() =>
      _RegisterRecipeDetailScreenState();
}

class _RegisterRecipeDetailScreenState
    extends State<RegisterRecipeDetailScreen> {
  RegisterRecipeDetailController get registerRecipeDetailController =>
      Get.find<RegisterRecipeDetailController>();
  TextEditingController recipeName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController amount = TextEditingController();
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
        padding: EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
        children: [
          DottedBorder(
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
                        style: TextStyle(color: AppColor.kPrimaryTextColor),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
              textEditingController: recipeName,
              textFieldType: TextFieldType.recipeNameField),
          CustomTextField(
              textEditingController: description,
              textFieldType: TextFieldType.recipeDesField),
          SizedBox(
            height: 20,
          ),
          GetBuilder(
            id: registerRecipeDetailController.categoryUpdate,
            builder: (RegisterRecipeDetailController controller) {
              return Row(
                children: FoodVegType.values
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          children: [
                            Image.asset(
                                FoodVegType.veg == e
                                    ? AppAssets.radioSelected
                                    : AppAssets.radioUnSelected,
                                height: 18),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              FoodVegType.veg == e ? "veg".tr : "non_veg".tr,
                              style: TextStyle(
                                  color: FoodVegType.veg == e
                                      ? AppColor.kPrimaryBlue
                                      : AppColor.kGreyColor),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)]),
            padding:
                EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "food_category".tr,
                  style: TextStyle(color: AppColor.kGreyColor),
                ),
                RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.navigate_next,
                      color: AppColor.kGreyColor,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          getTitle("quantity".tr),
          SizedBox(height: 5),
          CustomTextField(
              textEditingController: quantity,
              textFieldType: TextFieldType.quantityField),
          SizedBox(
            height: 20,
          ),
          getTitle(
            "add_your_amount".tr,
          ),
          SizedBox(height: 5),
          CustomTextField(
              textEditingController: amount,
              textFieldType: TextFieldType.amountField),
          SizedBox(
            height: 20,
          ),
          getTitle("availability".tr),
          SizedBox(height: 5),
          Divider(),
          getTitle("weekly".tr),
          SizedBox(height: 10),
          GetBuilder(
            id: registerRecipeDetailController.weekDayUpdate,
            builder: (RegisterRecipeDetailController controller) {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: WeekDayName.values.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, crossAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return DottedCircleContainer(
                    text: WeekDayName.values[index].name.characters.first
                        .toUpperCase(),
                    onTap: () {
                      controller.addRemoveWeekDay(WeekDayName.values[index]);
                    },
                    isSelected:
                        controller.weekDay.contains(WeekDayName.values[index]),
                  );
                },
              );
            },
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          getTitle("monthly".tr),
          SizedBox(height: 15),
          GetBuilder(
            id: registerRecipeDetailController.dateUpdate,
            builder: (RegisterRecipeDetailController controller) {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 31,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15),
                itemBuilder: (BuildContext context, int index) {
                  return DottedCircleContainer(
                    text: (index + 1).toString(),
                    onTap: () {
                      controller.addRemoveDateDay(index);
                    },
                    isSelected: controller.dateSelected.contains(index),
                  );
                },
              );
            },
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.filterBorderButton,
                    text: "save".tr,
                    onTap: () {}),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.filterColorButton,
                    text: "submit".tr,
                    onTap: () {
                      Get.toNamed(RecipePageScreen.routeName);
                    }),
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {},
                child: FittedBox(
                  child: Text(
                    "t_c_apply".tr,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColor.kPrimaryBlue),
                  ),
                )),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Text getTitle(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColor.kGreyColor,
          fontSize: 15,
          fontWeight: FontWeight.w500),
    );
  }
}

class DottedCircleContainer extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isSelected;
  const DottedCircleContainer(
      {Key? key, this.onTap, required this.text, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
          borderType: BorderType.Circle,
          dashPattern: [4],
          color: AppColor.kPrimaryBlue,
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? AppColor.kPrimaryTextColor.withOpacity(0.20)
                  : Colors.transparent,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: isSelected
                        ? AppColor.kPrimaryBlue
                        : AppColor.kGreyColor),
              ),
            ),
          )),
    );
  }
}

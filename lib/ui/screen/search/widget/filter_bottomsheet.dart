import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';

void showFilterBottomSheet() async {
  Get.bottomSheet(FilterBottomSheet(),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))));
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.75,
      padding: EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 50,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffABCAE4)),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border(right: BorderSide(color: Color(0xffDFDFDF)))),
                  padding: EdgeInsets.only(left: 5, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Category",
                      "Price",
                      "Distance",
                      "Discount",
                      "Cook Name",
                      "Availability",
                      "Cuisine"
                    ]
                        .map((e) => GestureDetector(
                              onTap: () {},
                              child: Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  margin: EdgeInsets.symmetric(vertical: 3),
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.kGreyColor),
                                  )),
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ["Veg", "Non-Veg"]
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColor.kPrimaryBlue)),
                                  child: Center(
                                      child: Icon(
                                    Icons.done,
                                    size: 9,
                                    color: AppColor.kPrimaryBlue,
                                  )),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  e,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.kPrimaryBlue),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.filterBorderButton,
                    text: "reset_filter".tr,
                    onTap: () {}),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.filterColorButton,
                    text: "apply_filter".tr,
                    onTap: () {
                      Get.back();
                    }),
              ),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/core/utils/app_function.dart';
import 'package:gharoghari/ui/screen/dashboard/dashboard_screen.dart';
import 'package:gharoghari/ui/widget/custom_textfield.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationInputScreen extends StatefulWidget {
  static const String routeName = '/locationInputScreen';

  const LocationInputScreen({Key? key}) : super(key: key);

  @override
  State<LocationInputScreen> createState() => _LocationInputScreenState();
}

class _LocationInputScreenState extends State<LocationInputScreen> {
  TextEditingController searchTLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.pink.shade50,
              alignment: Alignment.bottomCenter,
            ),
            SafeArea(
              child: IconButton(
                iconSize: 45,
                icon: Image.asset(
                  AppAssets.backButton,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height * 0.42,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Center(
                  child: Container(
                    height: Get.height * 0.42 - 1.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSettings.kDefaultPadding + 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "search_location".tr.toUpperCase(),
                          style: TextStyle(
                              color: AppColor.kPrimaryBlue, fontSize: 17),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                            textEditingController: searchTLocation,
                            textFieldType: TextFieldType.locationInputField),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "recent_location".tr,
                          style: TextStyle(
                              color: AppColor.kGreyColor, fontSize: 14),
                        ),
                        ListTile(
                          onTap: () {
                            Get.toNamed(DashBoardScreen.routeName);
                          },
                          title: Text(
                            "Sweet home, 86th strees, near by 88 street",
                            style: TextStyle(
                                color: AppColor.kGreyColor, fontSize: 13),
                          ),
                          horizontalTitleGap: 0,
                          leading: Image.asset(
                            AppAssets.location,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

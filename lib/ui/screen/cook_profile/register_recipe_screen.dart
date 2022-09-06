import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/cook_profile/register_recipe_detail_screen.dart';
import 'package:gharoghari/ui/screen/onboarding/onboarding.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/custom_textfield.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../core/const/app_colors.dart';
import 'add_recipe_screen.dart';

class RegisterRecipeScreen extends StatefulWidget {
  static const String routeName = '/registerRecipeScreen';

  const RegisterRecipeScreen({Key? key}) : super(key: key);

  @override
  State<RegisterRecipeScreen> createState() => _RegisterRecipeScreenState();
}

class _RegisterRecipeScreenState extends State<RegisterRecipeScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController houseFlatNumber = TextEditingController();
  TextEditingController passcode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController panCard = TextEditingController();
  TextEditingController aadharCard = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
      body: Form(
        key: formKey,
        child: ListView(
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
                                  image: AssetImage(
                                      "assets/dummy/Rectangle 9.png")),
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
            SizedBox(height: 20),
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
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    customTextField(
                        textEditingController: firstName,
                        textFieldType: TextFieldType.firstNameField),
                    SizedBox(height: 20),
                    customTextField(
                        textEditingController: lastName,
                        textFieldType: TextFieldType.lastNameField),
                    SizedBox(height: 20),
                    customTextField(
                        textEditingController: emailId,
                        textFieldType: TextFieldType.emailPlanField),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSettings.kDefaultPadding),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {},
                        selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            showFlags: false),
                        validator: (val) =>
                            val!.trim().isEmpty ? "field_required".tr : null,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        initialValue:
                            PhoneNumber(dialCode: "+44", isoCode: "GB"),
                        textFieldController: mobileNumber,
                        textStyle: const TextStyle(
                            fontFamily: AppSettings.kAppFont,
                            color: AppColor.kPrimaryBlue,
                            fontSize: 15),
                        locale: Get.locale!.languageCode,
                        spaceBetweenSelectorAndTextField: 0,
                        keyboardAction: TextInputAction.done,
                        inputDecoration: InputDecoration(
                          hintText: "phone_number".tr,
                          hintStyle: const TextStyle(
                              fontFamily: AppSettings.kAppFont,
                              fontSize: 15,
                              color: AppColor.kGreyColor),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.kGreyColor)),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColor.kPrimaryBlue)),
                        ),
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                      ),
                    ),
                    SizedBox(height: 20),
                    customTextField(
                        textEditingController: houseFlatNumber,
                        textFieldType: TextFieldType.houseFlatField),
                    SizedBox(height: 20),
                    customTextField(
                        textEditingController: houseFlatNumber,
                        textFieldType: TextFieldType.plan),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF0F0F0),
                          borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppSettings.kDefaultPadding),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.warning,
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "valid_only".tr,
                            style: TextStyle(
                                color: AppColor.kGreyColor, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    customTextField(
                        textEditingController: passcode,
                        textFieldType: TextFieldType.passCode),
                    SizedBox(height: 20),
                    customTextField(
                        textEditingController: state,
                        textFieldType: TextFieldType.state),
                    SizedBox(height: 15),
                    Container(
                      height: 3,
                      width: double.infinity,
                      color: Color(0xffDEE7EE),
                    ),
                    SizedBox(height: 20),
                    customTextField(
                        textEditingController: panCard,
                        textFieldType: TextFieldType.panNumberField),
                    SizedBox(height: 10),
                    customTextField(
                        textEditingController: aadharCard,
                        textFieldType: TextFieldType.adharNumber),
                    SizedBox(height: 30),
                    CustomButton(
                        padding: AppSettings.kDefaultPadding,
                        type: CustomButtonType.colourBlueButton,
                        text: "save_next".tr,
                        onTap: () {
                          Get.toNamed(RegisterRecipeDetailScreen.routeName);
                        }),
                    SizedBox(height: 20),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextField({
    required TextEditingController textEditingController,
    required TextFieldType textFieldType,
  }) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
      child: CustomTextField(
          textEditingController: textEditingController,
          textFieldType: textFieldType),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/custom_textfield.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/editProfileScreen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "profile".tr,
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
          padding:
              EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
          children: [
            CustomTextField(
                textEditingController: firstName,
                validator: (val) =>
                    val!.trim().isEmpty ? "field_required".tr : null,
                textFieldType: TextFieldType.firstNameField),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                textEditingController: firstName,
                validator: (val) =>
                    val!.trim().isEmpty ? "field_required".tr : null,
                textFieldType: TextFieldType.lastNameField),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                textEditingController: emailId,
                validator: (val) =>
                    val!.trim().isEmpty ? "field_required".tr : null,
                textFieldType: TextFieldType.emailPlanField),
            SizedBox(
              height: 15,
            ),
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {},
              selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
              validator: (val) =>
                  val!.trim().isEmpty ? "field_required".tr : null,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: PhoneNumber(dialCode: "+44", isoCode: "GB"),
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
                    borderSide: BorderSide(color: AppColor.kGreyColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.kPrimaryBlue)),
              ),
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(
                  horizontal: AppSettings.kDefaultPadding)
              .copyWith(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.filterBorderButton,
                    text: "reset".tr,
                    onTap: () {}),
              ),
              SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.filterColorButton,
                    text: "save".tr,
                    onTap: () {
                      Get.back();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:get/get.dart';

import '../../core/const/app_colors.dart';

enum TextFieldType {
  emailField,
  passwordField,
  emailPlanField,
  passwordPlanField,
  confirmPasswordPlanField,
  username,
  searchField,
  locationInputField,
  firstNameField,
  lastNameField,
  houseFlatField,
  panNumberField,
  adharNumber,
  passCode,
  state,
  recipeNameField,
  recipeDesField,
  quantityField,
  amountField,
  plan,
}

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextFieldType textFieldType;
  final String? Function(String?)? validator;
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.textFieldType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: AppColor.kPrimaryBlue),
      ),
      child: TextFormField(
        controller: textEditingController,
        validator: validator ??
            (val) => val!.trim().isEmpty ? "field_required".tr : null,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        style: const TextStyle(
            fontFamily: AppSettings.kAppFont,
            color: AppColor.kPrimaryBlue,
            fontSize: 13),
        decoration: InputDecoration(
          contentPadding: edgeInsetsGeometry,
          hintStyle: const TextStyle(
              fontFamily: AppSettings.kAppFont,
              fontSize: 13,
              color: AppColor.kGreyColor),
          enabledBorder: border,
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintText,
          focusedBorder: border,
        ),
      ),
    );
  }

  TextInputAction? get textInputAction {
    switch (textFieldType) {
      case TextFieldType.firstNameField:
      case TextFieldType.lastNameField:
      case TextFieldType.emailPlanField:
      case TextFieldType.recipeDesField:
      case TextFieldType.recipeNameField:
      case TextFieldType.quantityField:
        return TextInputAction.next;
      default:
        return null;
    }
  }

  EdgeInsetsGeometry? get edgeInsetsGeometry {
    switch (textFieldType) {
      case TextFieldType.searchField:
        return EdgeInsets.all(15);
      case TextFieldType.locationInputField:
        return EdgeInsets.zero;
      case TextFieldType.amountField:
      case TextFieldType.quantityField:
        return EdgeInsets.zero.copyWith(
            left: AppSettings.kDefaultPadding,
            right: AppSettings.kDefaultPadding);

      default:
        return null;
    }
  }

  InputBorder get border {
    switch (textFieldType) {
      case TextFieldType.quantityField:
      case TextFieldType.amountField:
        return OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.kGreyColor, width: 1.5),
            borderRadius: BorderRadius.circular(100));
      case TextFieldType.searchField:
        return OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffB3C9DD)),
            borderRadius: BorderRadius.circular(100));
      case TextFieldType.locationInputField:
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: AppColor.kPinkTextColor, width: 1.5));
      default:
        return const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColor.kGreyColor));
    }
  }

  Widget? get prefix {
    switch (textFieldType) {
      case TextFieldType.emailField:
        return const Icon(
          Icons.alternate_email,
        );
      case TextFieldType.locationInputField:
        return FittedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
            child: Center(
              child: Image.asset(
                AppAssets.searchLocation,
                height: 20,
              ),
            ),
          ),
        );
      case TextFieldType.passwordField:
        return const Icon(
          Icons.lock_open,
        );
      case TextFieldType.searchField:
        return const Icon(
          Icons.search,
          size: 28,
        );
      default:
        return null;
    }
  }

  Widget? get suffix {
    switch (textFieldType) {
      case TextFieldType.passwordField:
        return TextButton(
          onPressed: () {},
          child: Text("forgot".tr,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: AppSettings.kAppFont,
                color: Color(0xffFF9F9E),
              )),
        );
      default:
        return null;
    }
  }

  String? get hintText {
    switch (textFieldType) {
      case TextFieldType.emailField:
      case TextFieldType.emailPlanField:
        return "email_id".tr;
      case TextFieldType.passwordField:
      case TextFieldType.passwordPlanField:
        return "password".tr;
      case TextFieldType.confirmPasswordPlanField:
        return "confirm_password".tr;
      case TextFieldType.username:
        return "username".tr;
      case TextFieldType.searchField:
        return "recipe_name_or_dish".tr;
      case TextFieldType.locationInputField:
        return "search_for_your".tr;
      case TextFieldType.firstNameField:
        return "first_name".tr;
      case TextFieldType.lastNameField:
        return "last_name".tr;
      case TextFieldType.passCode:
        return "passcode".tr;
      case TextFieldType.adharNumber:
        return "aadhar_card_number".tr;
      case TextFieldType.panNumberField:
        return "pan_number".tr;
      case TextFieldType.state:
        return "state".tr;
      case TextFieldType.houseFlatField:
        return "house_flat".tr;
      case TextFieldType.plan:
        return "";
      case TextFieldType.recipeDesField:
        return "recipe_des".tr;
      case TextFieldType.recipeNameField:
        return "recipe_name".tr;
      case TextFieldType.amountField:
        return "amount".tr;
      case TextFieldType.quantityField:
        return "quantity".tr;
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/core/utils/app_function.dart';
import 'package:gharoghari/ui/screen/authentication/widget/enter_otp_screen.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/custom_textfield.dart';
import 'package:gharoghari/ui/widget/line_scaffold.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = '/createAccountScreen';

  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: LineContainer(
            children: [
              const SizedBox(
                height: 210,
              ),
              Text(
                "sign_up".tr,
                style: context.textTheme.headline1,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field_required".tr : null,
                  textEditingController: username,
                  textFieldType: TextFieldType.username),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field_required".tr : null,
                  textEditingController: email,
                  textFieldType: TextFieldType.emailPlanField),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field_required".tr : null,
                  textEditingController: username,
                  textFieldType: TextFieldType.passwordPlanField),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field_required".tr : null,
                  textEditingController: username,
                  textFieldType: TextFieldType.confirmPasswordPlanField),
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
                textFieldController: phoneNumber,
                textStyle: const TextStyle(
                    fontFamily: AppSettings.kAppFont,
                    color: AppColor.kPrimaryBlue,
                    fontSize: 15),
                locale: Get.locale!.languageCode,
                spaceBetweenSelectorAndTextField: 0,
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
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                  type: CustomButtonType.colourBlueButton,
                  text: "continue".tr.toUpperCase(),
                  onTap: () {
                    formKey.currentState!.validate();
                    formKey.currentState!.save();
                    Get.toNamed(EnterOTPScreen.routeName,
                        arguments: OtpScreenType.mobileOtp);
                  }),
              SizedBox(
                height: 30,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "${"already_have".tr} ",
                      style: TextStyle(
                          color: AppColor.kGreyColor,
                          fontSize: 14,
                          fontFamily: AppSettings.kAppFont),
                      children: [
                        TextSpan(
                          text: "login".tr,
                          style: TextStyle(
                              color: AppColor.kPinkTextColor,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              fontFamily: AppSettings.kAppFont),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

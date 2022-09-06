import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/core/utils/app_function.dart';
import 'package:gharoghari/ui/screen/authentication/sign_up/create_account_screen.dart';
import 'package:gharoghari/ui/screen/authentication/widget/check_your_mail_screen.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/custom_textfield.dart';
import 'package:gharoghari/ui/widget/line_scaffold.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
          body: LineContainer(
        children: [
          const SizedBox(
            height: 210,
          ),
          Text(
            "login".tr,
            style: context.textTheme.headline1,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: email,
            textFieldType: TextFieldType.emailField,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            textEditingController: password,
            textFieldType: TextFieldType.passwordField,
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(CreateAccountScreen.routeName);
            },
            child: Container(
              color: Colors.transparent,
              child: Text(
                "create_account".tr,
                style: const TextStyle(
                    color: AppColor.kPrimaryBlue,
                    fontSize: 13.5,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            type: CustomButtonType.colourBlueButton,
            onTap: () {
              Get.toNamed(CheckYourMailScreen.routeName);
            },
            text: 'login'.tr.toUpperCase(),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "or_continue_with".tr,
              style: const TextStyle(color: Color(0xffB2C6D8), fontSize: 15),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialButton(
                  onTap: () {
                    print("facebook");
                  },
                  image: AppAssets.facebook),
              SizedBox(
                width: 15,
              ),
              socialButton(onTap: () {}, image: AppAssets.google),
              SizedBox(
                width: 15,
              ),
              socialButton(onTap: () {}, image: AppAssets.email),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "by_continue".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xffB2C6D8), fontSize: 12.5),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: RichText(
              text: TextSpan(text: "t&c".tr, style: textSpanStyle, children: [
                TextSpan(
                  text: "and".tr,
                  style: TextStyle(
                      color: Color(0xffFF9F9E),
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      fontFamily: AppSettings.kAppFont),
                ),
                TextSpan(
                  text: "privacy_policy".tr,
                  style: textSpanStyle,
                )
              ]),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      )),
    );
  }

  GestureDetector socialButton(
      {required Function() onTap, required String image}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 55,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }

  TextStyle get textSpanStyle {
    return const TextStyle(
        color: Color(0xffFF9F9E),
        fontSize: 13,
        decoration: TextDecoration.underline,
        fontFamily: AppSettings.kAppFont);
  }
}

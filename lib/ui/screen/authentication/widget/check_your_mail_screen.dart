import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/ui/screen/authentication/widget/enter_otp_screen.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/line_scaffold.dart';

class CheckYourMailScreen extends StatefulWidget {
  static const String routeName = '/checkYourMailScreen';

  const CheckYourMailScreen({Key? key}) : super(key: key);

  @override
  State<CheckYourMailScreen> createState() => _CheckYourMailScreenState();
}

class _CheckYourMailScreenState extends State<CheckYourMailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineContainer(
        wantToShowTitle: false,
        isScrolled: false,
        children: [
          SizedBox(
            height: 70,
          ),
          Center(
            child: Image.asset(
              AppAssets.emailOtpSent,
              height: 200,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "check_your_email".tr,
              style: TextStyle(fontSize: 23, color: AppColor.kPrimaryBlue),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "email_sent_des".tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColor.kGreyColor),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
              type: CustomButtonType.colourBlueButton,
              text: "continue".tr.toUpperCase(),
              padding: 5,
              onTap: () {
                Get.toNamed(EnterOTPScreen.routeName,
                    arguments: OtpScreenType.emailOtp);
              }),
          Spacer(),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "resend_link".tr,
                  style: TextStyle(color: AppColor.kPinkTextColor),
                ),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        TextStyle(color: AppColor.kPinkTextColor)),
                    overlayColor: MaterialStateProperty.all(
                        AppColor.kPinkTextColor.withOpacity(0.10))),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "manually_enter_otp".tr,
                  style: TextStyle(color: AppColor.kPinkTextColor),
                ),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        TextStyle(color: AppColor.kPinkTextColor)),
                    overlayColor: MaterialStateProperty.all(
                        AppColor.kPinkTextColor.withOpacity(0.10))),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

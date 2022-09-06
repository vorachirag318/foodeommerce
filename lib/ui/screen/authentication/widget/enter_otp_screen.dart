import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/core/utils/app_function.dart';
import 'package:gharoghari/ui/screen/authentication/sign_up/create_account_screen.dart';
import 'package:gharoghari/ui/screen/location/location_input_screen.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/line_scaffold.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

enum OtpScreenType { emailOtp, mobileOtp }

class EnterOTPScreen extends StatefulWidget {
  static const String routeName = '/enterOtpScreen';

  const EnterOTPScreen({Key? key}) : super(key: key);

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  OtpFieldController otpController = OtpFieldController();
  late OtpScreenType otpScreenType;
  @override
  void initState() {
    otpScreenType = Get.arguments;
    super.initState();
  }

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
              otpScreenType == OtpScreenType.mobileOtp
                  ? "otp_verification".tr
                  : "login".tr,
              style: context.textTheme.headline1,
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              children: [
                Text(
                  otpScreenType == OtpScreenType.mobileOtp
                      ? "mobile_sent_dis".tr
                      : "email_sent_des".tr,
                  style: TextStyle(fontSize: 14, color: AppColor.kGreyColor),
                ),
                Text(
                  otpScreenType == OtpScreenType.mobileOtp
                      ? "+44 89453 46789"
                      : "K*****6@gmail.com",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 14, color: AppColor.kPinkTextColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: OTPTextField(
                length: 4,
                controller: otpController,
                width: MediaQuery.of(context).size.width - 50,
                fieldWidth: 50,
                onChanged: (val) {},
                inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: AppColor.kPrimaryBlue),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {},
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "00:22",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: AppColor.kGreyColor),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "didn't_receive".tr,
                      style: TextStyle(
                          color: AppColor.kGreyColor,
                          fontSize: 15,
                          fontFamily: AppSettings.kAppFont),
                      children: [
                        TextSpan(
                            text: "resend_otp".tr,
                            style: TextStyle(
                                color: AppColor.kPinkTextColor,
                                fontFamily: AppSettings.kAppFont,
                                decoration: TextDecoration.underline,
                                fontSize: 15))
                      ])),
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
                type: CustomButtonType.colourBlueButton,
                padding: 5,
                text: otpScreenType == OtpScreenType.mobileOtp
                    ? "continue".tr.toUpperCase()
                    : "login".tr.toUpperCase(),
                onTap: () {
                  Get.toNamed(LocationInputScreen.routeName);
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

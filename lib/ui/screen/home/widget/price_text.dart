import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_settings.dart';

class DollarWithPrice extends StatelessWidget {
  final int price;
  final String? fontFamily;
  const DollarWithPrice({Key? key, required this.price, this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(crossAxisAlignment: WrapCrossAlignment.end, children: [
      Text(
        "\$",
        style: TextStyle(
            color: AppColor.kPrimaryBlue,
            fontSize: 14,
            fontFamily: AppSettings.kAppFont),
      ),
      Text(
        "$price",
        style: TextStyle(
            color: AppColor.kPrimaryBlue,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily ?? AppSettings.kAppFont),
      )
    ]);
  }
}

class PriceDiscount extends StatelessWidget {
  final int mrp;
  final int discountPercent;
  final double? fontSize;
  const PriceDiscount(
      {Key? key,
      required this.mrp,
      required this.discountPercent,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "\$$mrp",
            style: TextStyle(
                color: AppColor.kGreyColor,
                fontSize: fontSize ?? 10,
                decoration: TextDecoration.lineThrough),
            children: [
          TextSpan(
            text: "($discountPercent%${"off".tr})",
            style: TextStyle(
                color: AppColor.kGreyColor,
                fontSize: fontSize ?? 10,
                decoration: TextDecoration.none),
          )
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';

class OrderHistoryScreen extends StatefulWidget {
  static const String routeName = "/orderHistoryScreen";

  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "order_history".tr,
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
      body: Column(
        children: [
          Divider(),
        ],
      ),
    );
  }
}

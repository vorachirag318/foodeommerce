import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/home/home_tab.dart';
import 'package:gharoghari/ui/screen/home/widget/price_text.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/image_container.dart';

class ItemCheckOutScreen extends StatefulWidget {
  static const String routeName = '/itemCheckOutScreen';

  const ItemCheckOutScreen({Key? key}) : super(key: key);

  @override
  State<ItemCheckOutScreen> createState() => _ItemCheckOutScreenState();
}

class _ItemCheckOutScreenState extends State<ItemCheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 10),
          ...List.generate(
              2,
              (index) => Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black12,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSettings.kDefaultPadding, vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/dummy/Mask group.png"))),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Facy Dhosa",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Adress",
                                style: TextStyle(
                                    fontSize: 13, color: AppColor.kGreyColor),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  DollarWithPrice(price: 70),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Image.asset(
                                      AppAssets.veg,
                                      height: 25,
                                    ),
                                  ),
                                  SizedBox(width: 10)
                                ],
                              )
                            ],
                          ),
                        ),
                        Align(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                    AppAssets.deletePlain,
                                    height: 30,
                                  )),
                              SizedBox(height: 20),
                              Container(
                                height: 30,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: AppColor.kPrimaryBlue)),
                                padding: EdgeInsets.all(3),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Row(
                                    children: [
                                      Container(
                                        color: AppColor.kGreyColor
                                            .withOpacity(0.30),
                                        padding: EdgeInsets.all(2),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                            color: AppColor.kPrimaryBlue,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColor.kPrimaryBlue),
                                        ),
                                      ),
                                      Container(
                                        color: AppColor.kGreyColor
                                            .withOpacity(0.30),
                                        padding: EdgeInsets.all(2),
                                        child: Center(
                                          child: Icon(
                                            size: 15,
                                            Icons.add,
                                            color: AppColor.kPrimaryBlue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
          SizedBox(
            height: 15,
          ),
          divider(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSettings.kDefaultPadding),
            child: ScreenCategoryTitle(text: "order_details", showMore: false),
          ),
          getPriceSub(title: "item_total".tr, price: 210, isMain: true),
          getPriceSub(title: "delivery_fees".tr, price: 210),
          getPriceSub(title: "taxes_and_charges".tr, price: 210),
          getPriceSub(title: "coupon_saving".tr),
          SizedBox(height: 10),
          divider(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSettings.kDefaultPadding, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "order_total".tr,
                    style: TextStyle(
                        color: AppColor.kPrimaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Text(
                  "\$240",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: AppColor.kPrimaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.kGreyColor),
                borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
                horizontal: AppSettings.kDefaultPadding, vertical: 5),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.kGreyColor),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                          child: Image.asset(
                        AppAssets.location,
                        height: 20,
                      )),
                    ),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColor.kPrimaryBlue,
                        child: Center(
                          child:
                              Icon(Icons.done, size: 12, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deliver to Other",
                        style: TextStyle(
                            color: AppColor.kPrimaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      Text(
                        "sweet home, 86th strees, near by 88 street",
                        style:
                            TextStyle(color: AppColor.kGreyColor, fontSize: 14),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "email_address".tr,
                          style: TextStyle(
                              color: AppColor.kPrimaryBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(
              horizontal: AppSettings.kDefaultPadding, vertical: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DollarWithPrice(price: 240, fontFamily: ""),
                  Text(
                    "view_price_detail".tr,
                    style: TextStyle(color: AppColor.kGreyColor, fontSize: 10),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.colourBlueButton,
                    text: "proceed_to_pay".tr,
                    onTap: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container divider() {
    return Container(
      height: 2,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: AppSettings.kDefaultPadding),
      color: Color(0xffDEE7EE),
    );
  }

  Widget getPriceSub({required String title, int? price, bool isMain = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSettings.kDefaultPadding, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  color: isMain ? Color(0xff727583) : AppColor.kGreyColor,
                  fontSize: 15),
            ),
          ),
          Visibility(
            visible: price != null,
            child: Text(
              "${isMain ? "" : "+  "}\$$price",
              style: TextStyle(
                  color: isMain ? Color(0xff727583) : AppColor.kGreyColor,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

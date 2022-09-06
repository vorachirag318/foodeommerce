import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/core/utils/config.dart';
import 'package:gharoghari/ui/screen/cart/item_check_out_screen.dart';
import 'package:gharoghari/ui/screen/home/widget/price_text.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:readmore/readmore.dart';

import 'item_box.dart';

class ItemDetailScreen extends StatelessWidget {
  static const String routeName = '/itemDetailScreen';

  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: Customshape(),
                child: Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                          image: AssetImage("assets/dummy/Mask group.png"))),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 45,
                          padding: EdgeInsets.all(11),
                          icon: Image.asset(
                            AppAssets.backButton,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.70)),
                              padding: EdgeInsets.all(7),
                              margin: EdgeInsets.all(13),
                              child: Icon(
                                Icons.favorite,
                                size: 18,
                                color: Colors.red,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSettings.kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 400,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage("assets/dummy/Rectangle 9.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
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
                                "By heny",
                                style: TextStyle(
                                    color: AppColor.kGreyColor, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                DollarWithPrice(price: 70),
                                SizedBox(
                                  height: 5,
                                ),
                                PriceDiscount(
                                  mrp: 100,
                                  discountPercent: 30,
                                  fontSize: 12,
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        borderContainer(
                            iconData: Icons.star_border_outlined,
                            title: "4.3",
                            des: "(2036 ${"review".tr})"),
                        borderContainer(
                            iconData: Icons.location_on_outlined,
                            title: "4.3",
                            des: "km".tr),
                        borderContainer(
                            image: AppAssets.calendar,
                            iconData: Icons.location_on_sharp,
                            title: "4.3",
                            des: "km".tr),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    dualText(
                        text1: "Khichdi Recipe - ",
                        text2:
                            "very healthy, light on stomach and made with very few ingredients. It is also known as ‘sadi khichdi’ in Gujarati language meaning plain khichdi."),
                    SizedBox(
                      height: 12,
                    ),
                    readMoreText(
                        "very healthy, light on stomach and made with very few ingredients. It is read more very healthy, light on stomach and made with very few ingredients.very healthy, light on stomach and made with very few ingredients. It is read more very healthy, light on stomach and made with very few ingredients."),
                    SizedBox(
                      height: 15,
                    ),
                    dualText(
                        text1: "Benefits - ",
                        text2:
                            "very healthy, light on stomach and made with very few ingredients. It is also known as ‘sadi khichdi’ in Gujarati language meaning plain khichdi."),
                    SizedBox(
                      height: 20,
                    ),
                    Text("availability".tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: AppSettings.kAppFont,
                            fontSize: 18,
                            color: AppColor.kDecColor)),
                    SizedBox(
                      height: 15,
                    ),
                    availabilityTile(AppAssets.clock, "Order By 2 PM Weekends"),
                    availabilityTile(
                        AppAssets.transport, "11 Am-3 PM  weekdays only"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.kGreyColor),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "other_recipe".tr,
                        style: TextStyle(
                            color: AppColor.kDecColor,
                            decoration: TextDecoration.underline,
                            fontSize: 13),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: List.generate(
                            4,
                            (index) => ItemBox(
                                  margin: EdgeInsets.only(right: 10),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 3,
                      width: double.infinity,
                      color: Color(0xffDEE7EE),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffDEE7EE),
                          ),
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: AppSettings.kDefaultPadding,
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage("assets/dummy/Rectangle 9.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Keyur Kachhadiya"),
                                    Text(
                                      "(21 aug, 2022)",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xff727583)),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "4.3",
                                    style:
                                        TextStyle(fontFamily: "", fontSize: 14),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 24,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              PopupMenuButton<String>(
                                itemBuilder: (context) => [
                                  "delete".tr,
                                  "edit".tr
                                ]
                                    .map(
                                      (e) => PopupMenuItem(
                                        value: e,
                                        height: 25,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              e,
                                              style: TextStyle(
                                                  color: AppColor.kGreyColor,
                                                  fontSize: 15),
                                            ),
                                            e == "edit".tr
                                                ? SizedBox()
                                                : Divider(
                                                    color: AppColor.kGreyColor,
                                                  )
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                                padding: EdgeInsets.all(5),
                                offset: Offset(0, 40),
                                iconSize: 20,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSettings.kDefaultPadding),
                            child: readMoreText(
                                "this dish was the bomb! simple. love it, i even ate the crust! not much room to sit   read more.."),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )),
                              Text(
                                "25 ${"likes".tr}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: AppSettings.kAppFont,
                                    fontSize: 13,
                                    color: AppColor.kGreyColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.forwardComment,
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "reply".tr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: AppSettings.kAppFont,
                                            fontSize: 13,
                                            color: AppColor.kGreyColor),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSettings.kDefaultPadding, vertical: 8),
          child: Row(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColor.kPrimaryBlue)),
                padding: EdgeInsets.all(3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Row(
                    children: [
                      Container(
                        color: AppColor.kGreyColor.withOpacity(0.30),
                        padding: EdgeInsets.all(2),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: AppColor.kPrimaryBlue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontSize: 19, color: AppColor.kPrimaryBlue),
                        ),
                      ),
                      Container(
                        color: AppColor.kGreyColor.withOpacity(0.30),
                        padding: EdgeInsets.all(2),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: AppColor.kPrimaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                    type: CustomButtonType.colourBlueButton,
                    text: "",
                    customizableChild: Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          AppAssets.bagSelected,
                          height: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "add_to_cart".tr.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                      ],
                    ),
                    onTap: () {
                      Get.toNamed(ItemCheckOutScreen.routeName);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget readMoreText(String text) {
    return ReadMoreText(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: AppSettings.kAppFont,
          fontSize: 12,
          color: AppColor.kGreyColor),
      trimExpandedText: "read_less".tr,
      trimCollapsedText: "read_more".tr,
      trimLines: 2,
      trimMode: TrimMode.Line,
      lessStyle: TextStyle(
          color: AppColor.kDecColor, fontSize: 12, fontWeight: FontWeight.bold),
      moreStyle: TextStyle(
          color: AppColor.kDecColor, fontSize: 12, fontWeight: FontWeight.bold),
    );
  }

  Padding availabilityTile(String icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSettings.kDefaultPadding, vertical: 5),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 22,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: AppSettings.kAppFont,
                fontSize: 13,
                color: AppColor.kGreyColor),
          )
        ],
      ),
    );
  }

  Widget dualText({required String text1, required String text2}) {
    return RichText(
        text: TextSpan(
            text: text1,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AppSettings.kAppFont,
                fontSize: 18,
                color: AppColor.kDecColor),
            children: [
          TextSpan(
            text: text2,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: AppSettings.kAppFont,
                fontSize: 12,
                color: AppColor.kGreyColor),
          )
        ]));
  }

  Expanded borderContainer(
      {required IconData iconData,
      String? image,
      required String title,
      required String des}) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: AppColor.kGreyColor)),
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image != null
                  ? Image.asset(
                      image,
                      height: 26,
                    )
                  : Icon(
                      iconData,
                      size: 26,
                      color: AppColor.kPinkTextColor,
                    ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 25,
                    color: AppColor.kGreyColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: ""),
              ),
              Text(
                des,
                maxLines: 1,
                style: TextStyle(fontSize: 11, color: AppColor.kGreyColor),
              )
            ],
          )),
    );
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    double factor = 63;
    var path = Path();
    path.lineTo(0, height - factor * 2);
    path.quadraticBezierTo(0, height - factor, factor, height - factor);
    path.lineTo(width - factor, height - factor);
    path.quadraticBezierTo(width, height - factor, width, height);
    path.lineTo(width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

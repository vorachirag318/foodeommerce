import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/core/utils/config.dart';
import 'package:gharoghari/ui/screen/home/widget/carousel_with_indicator.dart';
import 'package:gharoghari/ui/screen/home/widget/item_box.dart';
import 'package:gharoghari/ui/screen/home/widget/price_text.dart';
import 'package:gharoghari/ui/screen/profile/profile_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselWithIndicator(),
          Padding(
            padding: const EdgeInsets.only(left: AppSettings.kDefaultPadding),
            child: ScreenCategoryTitle(text: "top_categories".tr),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) => ItemBox()),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) => ItemBox()),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
                  horizontal: AppSettings.kDefaultPadding)
              .copyWith(top: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(ProfileScreen.routeName);
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/dummy/Rectangle 9.png"),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello, Heny",
                    style: TextStyle(
                        color: AppColor.kPrimaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Laxmi nagar soc",
                        style:
                            TextStyle(color: AppColor.kGreyColor, fontSize: 12),
                      ),
                      RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.navigate_next,
                            color: AppColor.kPinkTextColor,
                          ))
                    ],
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  iconSize: 37,
                  icon: Image.asset(
                    AppAssets.notification,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ScreenCategoryTitle extends StatelessWidget {
  final String text;
  final bool showMore;
  const ScreenCategoryTitle(
      {Key? key, required this.text, this.showMore = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
              color: AppColor.kPrimaryBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        showMore
            ? TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "show_all".tr,
                      style: TextStyle(
                          color: AppColor.kSecondaryTextColor, fontSize: 12),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColor.kSecondaryTextColor,
                      ),
                    )
                  ],
                ))
            : SizedBox(),
      ],
    );
  }
}

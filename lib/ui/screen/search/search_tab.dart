import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/core/utils/app_function.dart';
import 'package:gharoghari/core/utils/config.dart';
import 'package:gharoghari/ui/screen/home/home_tab.dart';
import 'package:gharoghari/ui/screen/search/widget/filter_bottomsheet.dart';
import 'package:gharoghari/ui/widget/custom_textfield.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab>
    with AutomaticKeepAliveClientMixin {
  TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  textEditingController: searchText,
                  textFieldType: TextFieldType.searchField,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  showFilterBottomSheet();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffB3C9DD)),
                      shape: BoxShape.circle),
                  padding: EdgeInsets.all(12),
                  child: Image.asset(AppAssets.settingFilter),
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                        10,
                        (index) => Container(
                              child: Text(
                                "Cake",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
                              decoration: BoxDecoration(
                                  color: AppColor.kGreyColor.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(100)),
                            )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: List.generate(
                        10,
                        (index) => Container(
                              child: Text(
                                "Chhole Bhature",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.fromLTRB(17, 10, 17, 10),
                              decoration: BoxDecoration(
                                  color: AppColor.kGreyColor.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(100)),
                            )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppSettings.kDefaultPadding),
              child: ScreenCategoryTitle(text: "recent_search".tr),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    3,
                    (index) => Container(
                          width: Get.width * 0.60,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black12,
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.only(
                              left: AppSettings.kDefaultPadding,
                              top: 10,
                              bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: getWidth(130),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/dummy/Mask group.png"))),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Dolma With Rice",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Bayramoğlu",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

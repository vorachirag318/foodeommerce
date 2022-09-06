import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';
import 'package:gharoghari/ui/screen/authentication/login_screen.dart';
import 'package:gharoghari/ui/widget/custom_button.dart';
import 'package:gharoghari/ui/widget/line_scaffold.dart';
import 'package:get/get.dart';

class OnBoardingModel {
  final String image;
  final String description;
  final String title;

  OnBoardingModel(
      {required this.image, required this.description, required this.title});
}

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onBoardingScreen';

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int initialIndex = 0;
  PageController pageController = PageController();
  List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        image: AppAssets.onBoarding1,
        description: "obdDes".tr,
        title: "obd1Title".tr),
    OnBoardingModel(
        image: AppAssets.onBoarding2,
        description: "obdDes".tr,
        title: "obd2Title".tr),
    OnBoardingModel(
        image: AppAssets.onBoarding3,
        description: "obdDes".tr,
        title: "obd3Title".tr)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Spacer(),
                InnerShadow(
                  color: Color(0xffFF9F9E).withOpacity(0.20),
                  child: Container(
                    height: 280,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PageView.builder(
              itemCount: onBoardingData.length,
              controller: pageController,
              itemBuilder: (BuildContext context, int index) {
                final e = onBoardingData[index];
                return Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        e.image,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSettings.kDefaultPadding * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            e.title,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            e.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.kGreyColor,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              CustomButton(
                                  type: CustomButtonType.colourRedButton,
                                  text: "login".tr,
                                  width: Get.width * 0.40,
                                  onTap: () {
                                    Get.toNamed(LoginScreen.routeName);
                                  }),
                              Spacer(),
                              IconButton(
                                  iconSize: 50,
                                  padding: EdgeInsets.all(3.0),
                                  onPressed: () {
                                    if (pageController.page == 2) {
                                      Get.toNamed(LoginScreen.routeName);
                                    } else {
                                      pageController.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease);
                                    }
                                  },
                                  icon: Image.asset(
                                    AppAssets.nextOnBoarding,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key? key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    Widget? child,
  }) : super(key: key, child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  late double blur;
  late Color color;
  late double dx;
  late double dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      // ..saveLayer(rectInner, Paint())
      ..translate(0, dy);
    context.paintChild(child!, offset);
    context.canvas
      ..restore()
      ..restore();
  }
}

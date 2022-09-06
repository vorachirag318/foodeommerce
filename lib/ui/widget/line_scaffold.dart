import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharoghari/core/const/app_icon.dart';
import 'package:gharoghari/core/const/app_settings.dart';

class LineContainer extends StatelessWidget {
  final List<Widget> children;
  final bool wantToShowTitle;
  final bool isScrolled;
  const LineContainer(
      {Key? key,
      required this.children,
      this.wantToShowTitle = true,
      this.isScrolled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isScrolled
          ? ListView(
              children: [buildStack(context)],
            )
          : buildStack(context),
    );
  }

  Stack buildStack(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 330,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.line), fit: BoxFit.fitWidth)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Navigator.canPop(context))
                IconButton(
                  iconSize: 45,
                  icon: Image.asset(
                    AppAssets.backButton,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              Spacer(),
              if (wantToShowTitle)
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      AppAssets.titleWhite,
                      height: 35,
                    ),
                  ),
                ),
              Spacer(),
              SizedBox(
                width: 68,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSettings.kDefaultPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        )
      ],
    );
  }
}

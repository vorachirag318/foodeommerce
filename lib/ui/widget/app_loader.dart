import 'package:flutter/material.dart';

import '../../core/const/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      strokeWidth: 2,
      color: AppColor.kPrimaryBlue,
    ));
  }
}

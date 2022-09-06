import 'package:flutter/material.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_settings.dart';

class ProfileToolTile extends StatelessWidget {
  final String icon;
  final String title;
  final String des;
  final void Function()? onTap;
  const ProfileToolTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.des,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          // contentPadding: EdgeInsets.zero,
          leading: Image.asset(icon, height: 25),
          title: Text(
            title,
            style: TextStyle(color: AppColor.kPrimaryTextColor),
          ),
          subtitle: Text(
            des,
            style: TextStyle(color: AppColor.kGreyColor, fontSize: 13),
          ),
          trailing: Icon(
            Icons.navigate_next,
            color: AppColor.kGreyColor,
          ),
        ),
        Divider(
          height: 0,
          indent: 32,
          endIndent: AppSettings.kDefaultPadding,
          color: Color(0xffDEE7EE),
        )
      ],
    );
  }
}

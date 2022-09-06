import 'package:flutter/material.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/utils/config.dart';

enum CustomButtonType {
  colourBlueButton,
  colourRedButton,
  borderButton,
  filterColorButton,
  filterBorderButton,
}

extension CustomButtonExtension on CustomButtonType {
  ButtonProps get props {
    switch (this) {
      case CustomButtonType.colourBlueButton:
        return ButtonProps(
          height: 50,
          radius: 50,
          linearGradient: AppColor.customBlueButtonGradient,
          textStyle: TextStyle(
              color: Colors.white,
              fontSize: getWidth(15.5),
              fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
        );
      case CustomButtonType.colourRedButton:
        return ButtonProps(
          height: 50,
          radius: 50,
          linearGradient: AppColor.customRedButtonGradient,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: getWidth(15.5),
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
        );

      case CustomButtonType.borderButton:
        return ButtonProps(
          height: 50,
          radius: 50,
          border: Border.all(color: AppColor.kPrimaryBlue, width: 1),
          textStyle: TextStyle(
            color: AppColor.kPrimaryBlue,
            fontSize: getWidth(15.5),
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.transparent,
        );
      case CustomButtonType.filterColorButton:
        return ButtonProps(
          height: 40,
          radius: 50,
          linearGradient: AppColor.customBlueButtonGradient,
          textStyle: TextStyle(
              color: Colors.white,
              fontSize: getWidth(13),
              fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
        );
      case CustomButtonType.filterBorderButton:
        return ButtonProps(
          height: 40,
          radius: 50,
          border: Border.all(color: AppColor.kPrimaryBlue, width: 1),
          textStyle: TextStyle(
            color: AppColor.kPrimaryBlue,
            fontSize: getWidth(13),
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.transparent,
        );
    }
  }
}

class ButtonProps {
  double height;
  double radius;
  TextStyle textStyle;
  BoxBorder? border;
  LinearGradient? linearGradient;
  Color backgroundColor;

  ButtonProps({
    required this.height,
    required this.radius,
    required this.textStyle,
    required this.backgroundColor,
    this.linearGradient,
    this.border,
  });
}

class CustomButton extends StatelessWidget {
  final CustomButtonType type;
  final String text;
  final double? width;
  final Function()? onTap;
  final ButtonProps props;
  final double padding;
  final Widget? customizableChild;

  CustomButton(
      {super.key,
      required this.type,
      required this.text,
      required this.onTap,
      props,
      this.padding = 0,
      this.customizableChild,
      this.width})
      : props = props ?? type.props;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: padding),
        width: width ?? double.infinity,
        height: props.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(props.radius)),
            gradient: props.linearGradient,
            color: props.backgroundColor,
            border: props.border),
        alignment: Alignment.center,
        child: customizableChild ??
            Text(text.toUpperCase(), style: props.textStyle),
      ),
    );
  }
}

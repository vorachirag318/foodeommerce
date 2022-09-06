import 'package:flutter/material.dart';
import 'package:gharoghari/core/const/app_colors.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
  });

  final Text text;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) =>
          AppColor.customBlueButtonGradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: text,
    );
  }
}

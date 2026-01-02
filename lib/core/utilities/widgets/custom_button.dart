import 'package:bookly/core/utilities/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backGroundColor,
    required this.fontWeight,
    this.borderRadius,
    required this.onPressed,
    this.fontSize,
    this.height,
  });
  final String text;
  final Color textColor;
  final Color backGroundColor;
  final FontWeight fontWeight;
  final BorderRadius? borderRadius;
  final void Function() onPressed;
  final double? fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

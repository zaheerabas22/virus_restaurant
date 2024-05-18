import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.btnWidth,
      this.btnHeight,
      this.btnColor,
      this.btnRadius,
      required this.text});

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final double? btnRadius;
  final Color? btnColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? width,
        height: btnHeight ?? 22.h,
        decoration: BoxDecoration(
          color: btnColor ?? kPrimary,
          borderRadius: BorderRadius.circular(btnRadius ?? 12.r),
        ),
        child: Center(
          child: ReuseableText(
            text: text,
            style: appStyle(12, kLightWhite, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

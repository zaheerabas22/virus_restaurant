import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';

class HomeTile extends StatelessWidget {
  const HomeTile(
      {super.key, this.onTap, required this.text, required this.iconpath});
  final void Function()? onTap;
  final String text;
  final String iconpath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            iconpath,
            width: 40.w,
            height: 40.h,
          ),
          ReuseableText(text: text, style: appStyle(11, kGray, FontWeight.w500))
        ],
      ),
    );
  }
}

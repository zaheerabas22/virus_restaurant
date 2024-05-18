import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReuseableText(
                      text: "Virus Foods",
                      style: appStyle(14.sp, Colors.white, FontWeight.bold),
                    ),
                    ReuseableText(
                      text: "E1 block Johar Town Lahore",
                      style: appStyle(
                        10.sp,
                        Colors.white,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/icons/open_sign.svg",
            height: 35.h,
            width: 35.w,
          )
        ],
      ),
    );
  }
}

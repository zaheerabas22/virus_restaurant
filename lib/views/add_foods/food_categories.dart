import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'package:virus_restaurant/constants/uidata.dart';
import 'package:virus_restaurant/feature/orders/controller/food_controller.dart';

class ChoseCategory extends HookWidget {
  const ChoseCategory({
    super.key,
    required this.next,
  });
  final Function() next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());

    return SizedBox(
      height: hieght,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ReuseableText(
                  text: 'Pick Categories',
                  style: appStyle(15, kGray, FontWeight.w600),
                ),
                ReuseableText(
                  text:
                      'You are to pick a category to continue adding a foos item',
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: hieght * 0.8,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final category = categories[i];
                return ListTile(
                  onTap: () {
                    controller.setCategory = category['_id'];
                    next();
                  },
                  leading: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: kPrimary,
                    child: Image.network(
                      category['imageUrl'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: ReuseableText(
                    text: category['title'],
                    style: appStyle(12, kGray, FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: kGray,
                    size: 15.sp,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

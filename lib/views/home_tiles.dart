import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:virus_restaurant/common/tile.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'package:virus_restaurant/views/add_foods/add_foods.dart';
import 'package:virus_restaurant/views/food.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 3.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      height: 65.h,
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeTile(
            onTap: () {
              Get.to(
                () => const AddFoods(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 500),
              );
            },
            text: "Add Foods",
            iconpath: "assets/icons/taco.svg",
          ),
          HomeTile(
            onTap: () {},
            text: "Wallet",
            iconpath: "assets/icons/wallet.svg",
          ),
          HomeTile(
            onTap: () {
              Get.to(
                () => const FoodPage(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 500),
              );
            },
            text: "Foods",
            iconpath: "assets/icons/french_fries.svg",
          ),
          HomeTile(
            onTap: () {},
            text: "Virus Deliveries",
            iconpath: "assets/icons/deliver_food.svg",
          ),
        ],
      ),
    );
  }
}

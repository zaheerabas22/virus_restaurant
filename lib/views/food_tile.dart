import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.food,
  });
  final Map<String, dynamic> food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: SizedBox(
                    width: 62.w,
                    height: 53.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        food['imageUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReuseableText(
                      text: food['title'],
                      style: appStyle(11, kDark, FontWeight.w500),
                    ),
                    ReuseableText(
                      text: "Delivery time: ${food['time']}",
                      style: appStyle(9, kGray, FontWeight.w500),
                    ),
                    SizedBox(
                      height: 16.h,
                      width: width * 0.57,
                      child: ListView.builder(
                          itemCount: food['additives'].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            String title = food['additives'][i]['title'];
                            return Container(
                              margin: EdgeInsets.only(right: 8.w),
                              decoration: BoxDecoration(
                                  color: kSecondaryLight,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: ReuseableText(
                                      text: title,
                                      style:
                                          appStyle(8, kGray, FontWeight.w400)),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              right: 5.w,
              top: 5.h,
              child: Container(
                height: 19.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: ReuseableText(
                    text: "\$${food['price'].toStringAsFixed(2)}",
                    style: appStyle(12, kLightWhite, FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

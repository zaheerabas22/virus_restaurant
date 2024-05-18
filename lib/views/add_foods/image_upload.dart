import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/custom_button.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'package:virus_restaurant/feature/orders/controller/uploader_controller.dart';

class ImageUploads extends StatelessWidget {
  const ImageUploads({super.key, required this.back, required this.next});
  final Function back;
  final Function next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadController());

    return SizedBox(
      height: hieght,
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReuseableText(
                text: 'Upload Images',
                style: appStyle(15, kGray, FontWeight.w600),
              ),
              ReuseableText(
                text: 'You are required to Upload 2 Images',
                style: appStyle(11, kGray, FontWeight.normal),
              ),
            ],
          ),
        ),
        SizedBox(
            height: hieght * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 120,
                        width: width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: kGrayLight),
                        ),
                        child: Center(
                          child: ReuseableText(
                            text: 'Upload Image',
                            style: appStyle(
                              16,
                              kDark,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('One');
                        },
                        child: Container(
                          height: 120,
                          width: width / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: Center(
                            child: ReuseableText(
                              text: 'Upload Image',
                              style: appStyle(
                                16,
                                kDark,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 120,
                        width: width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: kGrayLight),
                        ),
                        child: Center(
                          child: ReuseableText(
                            text: 'Upload Image',
                            style: appStyle(
                              16,
                              kDark,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: width / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: kGrayLight),
                        ),
                        child: Center(
                          child: ReuseableText(
                            text: 'Upload Image',
                            style: appStyle(
                              16,
                              kDark,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: "Back",
                        btnWidth: width / 3,
                        btnRadius: 9,
                        onTap: () {
                          back();
                        },
                      ),
                      CustomButton(
                        text: "Next",
                        btnWidth: width / 3,
                        btnRadius: 9,
                        onTap: next(),
                      ),
                    ],
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/bg_container.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'package:virus_restaurant/views/add_foods/food_categories.dart';
import 'package:virus_restaurant/views/add_foods/image_upload.dart';

class AddFoods extends StatefulWidget {
  const AddFoods({super.key});

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ReuseableText(
              text: 'Welcome to Virus Foods',
              style: appStyle(14, kLightWhite, FontWeight.w600),
            ),
            ReuseableText(
              text: 'Fill all the required info to add food items',
              style: appStyle(12, kLightWhite, FontWeight.normal),
            ),
          ],
        ),
      ),
      body: BackGroundContainer(
        child: ListView(
          children: [
            SizedBox(
              width: width,
              height: hieght,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                pageSnapping: false,
                children: [
                  ChoseCategory(
                    next: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                  ImageUploads(
                    back: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    next: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                  ChoseCategory(
                    next: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

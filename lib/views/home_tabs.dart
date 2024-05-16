import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/constants/constants.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Container(
        height: 20.h,
        width: width,
        decoration: BoxDecoration(
          color: kOffWhite,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.circular(25.r),
            ),
            labelColor: kOffWhite,
            dividerColor: Colors.transparent,
            unselectedLabelColor: kGrayLight,
            tabAlignment: TabAlignment.start,
            labelPadding: EdgeInsets.zero,
            isScrollable: true,
            unselectedLabelStyle: appStyle(11.5, kGrayLight, FontWeight.normal),
            labelStyle: appStyle(12, kOffWhite, FontWeight.w600),
            tabs: List.generate(
              orderList.length,
              (i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Tab(text: orderList[i]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

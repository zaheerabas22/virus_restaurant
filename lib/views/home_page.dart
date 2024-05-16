import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virus_restaurant/common/bg_container.dart';
import 'package:virus_restaurant/common/custom_appbar.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'home_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: orderList.length,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kSecondary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: AppBar(
            elevation: 0,
            backgroundColor: kSecondary,
            flexibleSpace: const CustomAppBar(),
          ),
        ),
        body: BackGroundContainer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const HomeTiles(),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Container(
                  height: 25.h,
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
                      tabs: List.generate(
                        orderList.length,
                        (i) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Tab(text: orderList[i]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

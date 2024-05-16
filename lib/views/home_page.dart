import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virus_restaurant/common/bg_container.dart';
import 'package:virus_restaurant/common/custom_appbar.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'package:virus_restaurant/orders/cancelled_order.dart';
import 'package:virus_restaurant/orders/delivered_order.dart';
import 'package:virus_restaurant/orders/new_orders.dart';
import 'package:virus_restaurant/orders/picked_order.dart';
import 'package:virus_restaurant/orders/preparing_order.dart';
import 'package:virus_restaurant/orders/ready_order.dart';
import 'package:virus_restaurant/orders/virus_deliveries.dart';
import 'home_tabs.dart';
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
              HomeTabs(tabController: _tabController),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                height: hieght * 0.58,
                color: Colors.transparent,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    NewOrders(),
                    PreparingOrder(),
                    ReadyOrder(),
                    PickedOrder(),
                    VirusDeliveries(),
                    DeliveredOrder(),
                    CancelledOrder(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

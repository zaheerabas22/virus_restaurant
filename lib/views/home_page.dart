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

class _HomePageState extends State<HomePage> {
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
              const HomeTiles()
            ],
          ),
        ),
      ),
    );
  }
}

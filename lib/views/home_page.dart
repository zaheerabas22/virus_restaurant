import 'package:flutter/material.dart';
import 'package:virus_restaurant/common/bg_container.dart';
import 'package:virus_restaurant/common/custom_appbar.dart';
import 'package:virus_restaurant/constants/constants.dart';

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
        backgroundColor: kPrimary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: AppBar(
            elevation: 0,
            backgroundColor: kPrimary,
            flexibleSpace: const CustomAppBar(),
          ),
        ),
        body: const BackGroundContainer(
            child: Center(child: Text("This is Home"))),
      ),
    );
  }
}

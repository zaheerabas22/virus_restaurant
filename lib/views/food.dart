import 'package:flutter/material.dart';
import 'package:virus_restaurant/common/app_style.dart';
import 'package:virus_restaurant/common/bg_container.dart';
import 'package:virus_restaurant/common/reuseable_text.dart';
import 'package:virus_restaurant/constants/constants.dart';
import 'package:virus_restaurant/constants/uidata.dart';
import 'package:virus_restaurant/views/food_tile.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondary,
        title: Center(
          child: ReuseableText(
              text: "Virus Foods",
              style: appStyle(18, kLightWhite, FontWeight.w600)),
        ),
      ),
      body: BackGroundContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, i) {
              final food = foods[i];
              return FoodTile(
                food: food,
              );
            },
          ),
        ),
      ),
    );
  }
}



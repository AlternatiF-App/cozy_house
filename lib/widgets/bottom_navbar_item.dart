 import 'package:cozy_house/theme.dart';
import 'package:flutter/material.dart';

 class BottomNavbarItem extends StatelessWidget {
  final String imageUrl; 
  final bool isActive;

  BottomNavbarItem({
    required this.imageUrl,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          this.imageUrl,
          width: 26,
        ),
        Spacer(),
        this.isActive 
        ? Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
             color: purpleColor,
             borderRadius: BorderRadius.vertical(
              top: Radius.circular(1000),
             ),
          ),
        )
        : Container(),
      ],
    );
  }
}
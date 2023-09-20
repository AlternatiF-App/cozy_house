import 'package:cozy_house/models/tips.dart';
import 'package:cozy_house/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.updateAt}' ,
              style: greyTextStyle,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
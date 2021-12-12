import 'package:flutter/material.dart';
import 'package:travelika/shared/theme.dart';

class InterestItem extends StatelessWidget {
  final String title;
  const InterestItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_checklist.png'),
              ),
            ),
          ),
          Text(
            title,
            style: blackTextStyle,
          )
        ],
      ),
    );
  }
}

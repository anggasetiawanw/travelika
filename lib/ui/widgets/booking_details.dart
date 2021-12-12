import 'package:flutter/material.dart';
import 'package:travelika/shared/theme.dart';

class BookingDetails extends StatelessWidget {
  final String title;
  final String valueText;
  final Color colorValue;
  const BookingDetails(
      {Key? key,
      required this.colorValue,
      required this.title,
      required this.valueText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icon_checklist.png'))),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
          Spacer(),
          Text(valueText,
              style: blackTextStyle.copyWith(
                  fontWeight: semiBold, color: colorValue))
        ],
      ),
    );
  }
}

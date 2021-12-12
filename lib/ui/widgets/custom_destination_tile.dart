import 'package:flutter/material.dart';
import 'package:travelika/models/destination_model.dart';
import 'package:travelika/shared/theme.dart';
import 'package:travelika/ui/pages/detail_pages.dart';
import 'package:travelika/ui/widgets/destination_card.dart';

class CustomDestionationTile extends StatelessWidget {
  final DestinationModel destinations;
  const CustomDestionationTile(this.destinations,
      {Key? key,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage(destinations)));
      },
      child: Container(
          margin: EdgeInsets.only(top: 18),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(destinations.imageUrl))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destinations.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      destinations.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icon_star.png'))),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        destinations.rating.toString(),
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

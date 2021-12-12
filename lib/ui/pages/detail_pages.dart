import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelika/models/destination_model.dart';
import 'package:travelika/shared/theme.dart';
import 'package:travelika/ui/pages/choose_seat_page.dart';
import 'package:travelika/ui/widgets/custom_button.dart';
import 'package:travelika/ui/widgets/interest_item.dart';
import 'package:travelika/ui/widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destinations;

  const DetailPage(this.destinations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              destinations.imageUrl,
            ),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ]),
        ),
      );
    }

    Widget content() {
      return SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            children: [
              //NOTE : TITLE
              SizedBox(
                height: 20,
              ),
              Container(
                width: 108,
                height: 24,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icon_emblem.png'))),
              ),
              Container(
                  margin: EdgeInsets.only(top: 236),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destinations.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              destinations.city,
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
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
                                style: whiteTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              //NOTE DESCRIPTION
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NOTE ABOUT
                    Text(
                      'About',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Text(
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: blackTextStyle.copyWith(
                        height: 2.5,
                      ),
                    ),
                    //NOTE PHOTOS
                    SizedBox(height: 20),
                    Text(
                      'Photos',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        PhotoItem(imageUrl: 'assets/images_photos1.png'),
                        PhotoItem(imageUrl: 'assets/images_photos2.png'),
                        PhotoItem(imageUrl: 'assets/images_photos3.png'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Interest',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        InterestItem(title: 'Kids Park'),
                        InterestItem(title: 'Honor Bridge'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InterestItem(title: 'City Museum'),
                        InterestItem(title: 'Centrak Mall'),
                      ],
                    ),
                  ],
                ),
              ),
              //NOTE PRICE & BOOKNOW
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(destinations.price),
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'per orang',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        title: 'Book Now',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseSeatPage(destinations),
                            ),
                          );
                        },
                        width: 170,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}

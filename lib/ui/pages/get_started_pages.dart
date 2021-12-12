import 'package:flutter/material.dart';
import 'package:travelika/ui/widgets/custom_button.dart';
import '../../shared/theme.dart';

class GetStartedPages extends StatelessWidget {
  const GetStartedPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images_getstarted.png'))),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Fly Like A Bird',
                style:
                    whiteTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: light),
                  textAlign: TextAlign.center),
              CustomButton(
                title: 'Get Started',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                width: 220,
                height: 55,
                margin: EdgeInsets.only(top: 50, bottom: 80),
              )
            ],
          ),
        )
      ])),
    );
  }
}

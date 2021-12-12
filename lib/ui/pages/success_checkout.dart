import 'package:flutter/material.dart';
import 'package:travelika/cubit/page_cubit.dart';
import 'package:travelika/shared/theme.dart';
import 'package:travelika/ui/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.only(bottom: 80),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images_success.png'))),
              ),
              Text(
                'Well Booked 😍',
                style:
                    blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
              ),
              SizedBox(height: 10),
              Text(
                'Are you ready to explore the new\nworld of experiences?',
                style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                title: 'My Bookings',
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                },
                width: 220,
                margin: EdgeInsets.only(top: 50),
              )
            ],
          ),
        ));
  }
}

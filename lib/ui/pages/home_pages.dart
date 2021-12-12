// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelika/cubit/auth_cubit.dart';
import 'package:travelika/cubit/destination_cubit.dart';
import 'package:travelika/models/destination_model.dart';
import 'package:travelika/shared/theme.dart';
import 'package:travelika/ui/widgets/custom_destination_tile.dart';
import 'package:travelika/ui/widgets/destination_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  left: defaultMargin, right: defaultMargin, top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text('Where to fly today?',
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: light)),
                      ],
                    ),
                  ),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images_profile.png'))))
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget populerDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destinations) {
              return DestinationCard(destinations);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 140,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New This Year',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                )),
            Column(
              children: destinations.map((DestinationModel destinations) {
                return CustomDestionationTile(destinations);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
        listener: (context, state) {
      if (state is DestinationFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kRedColor,
            content: Text(state.error),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is DestinationSuccess) {
        return ListView(children: [
          header(),
          populerDestinations(state.destinations),
          newDestinations(state.destinations),
        ]);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

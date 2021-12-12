import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelika/models/transaction_model.dart';
import 'package:travelika/shared/theme.dart';
import 'package:travelika/ui/widgets/booking_details.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage(transaction.destination.imageUrl))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
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
                        transaction.destination.rating.toString(),
                        style: blackTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          BookingDetails(
            colorValue: kBlackColor,
            title: 'Traveler',
            valueText: '${transaction.amountOfTraveller} Person',
          ),
          BookingDetails(
            colorValue: kBlackColor,
            title: 'Seat',
            valueText: transaction.selectedSeat,
          ),
          BookingDetails(
            colorValue: transaction.insurance ? kGreenColor : kRedColor,
            title: 'Insurance',
            valueText: transaction.insurance ? 'YES' : 'NO',
          ),
          BookingDetails(
            colorValue: transaction.refundable ? kGreenColor : kRedColor,
            title: 'Refundable',
            valueText: transaction.refundable ? 'YES' : 'NO',
          ),
          BookingDetails(
            colorValue: kBlackColor,
            title: 'VAT',
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
          ),
          BookingDetails(
            colorValue: kBlackColor,
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.price),
          ),
          BookingDetails(
            colorValue: kPrimaryColor,
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.grandTotal),
          ),
        ],
      ),
    );
  }
}

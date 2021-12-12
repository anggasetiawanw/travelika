import 'package:equatable/equatable.dart';
import 'package:travelika/models/destination_model.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int amountOfTraveller;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destination,
    this.id = '',
    this.amountOfTraveller = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.price = 0,
    this.grandTotal = 0,
    this.vat = 0.0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        destination: DestinationModel.fromJson(
            json['destination']['id'], json['destination']),
        id: id,
        amountOfTraveller: json['amounOfTraveler'],
        selectedSeat: json['selectedSeat'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        destination,
        amountOfTraveller,
        selectedSeat,
        insurance,
        refundable,
        price,
        grandTotal,
        vat,
      ];
}

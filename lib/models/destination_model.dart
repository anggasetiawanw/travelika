import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final int price;
  final String imageUrl;
  final double rating;

  DestinationModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.price = 0,
    this.rating = 0.0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        price: json['price'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
      );
  Map<String, dynamic> toJson() => {
    'id' : id,
    'name': name,
    'city': city,
    'imageUrl': imageUrl,
    'rating': rating,
    'price':price,




  };

  @override
  List<Object?> get props => [id, name, city, imageUrl, price, rating];
}
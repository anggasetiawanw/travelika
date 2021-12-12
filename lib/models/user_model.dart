import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String hobby;
  final int balance;

  UserModel(
      {required this.id,
      required this.email,
      this.balance = 0,
      this.hobby = '',
      required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id,email,name,hobby,balance];
}

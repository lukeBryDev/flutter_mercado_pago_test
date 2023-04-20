import 'package:equatable/equatable.dart';

class MPPaymentUnsuccessfulResultEntity extends Equatable {
  final String? message;

  const MPPaymentUnsuccessfulResultEntity({this.message});

  @override
  List<Object?> get props => [message];
}

import 'package:mercado_pago_example/src/features/domain/entities/mp_payment_unsuccessful_result_entity.dart';

class MPPaymentUnsuccessfulResultModel
    extends MPPaymentUnsuccessfulResultEntity {
  const MPPaymentUnsuccessfulResultModel({String? message})
      : super(message: message);

  factory MPPaymentUnsuccessfulResultModel.fromJson(Map<String, dynamic> json) {
    return MPPaymentUnsuccessfulResultModel(
      message: json["message"],
    );
  }
}

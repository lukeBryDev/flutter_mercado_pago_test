import 'package:mercado_pago_example/src/features/data/dtos/mp_payer_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_payment_methods_dto.dart';
import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_currence_id_type.dart';

/// preference params. Visit https://www.mercadopago.com.co/developers/es/docs/checkout-pro-v1/configurations
class MPPreferenceItemDTO {
  final String title;
  final int quantity;
  final MPCurrencyIdType currencyId;
  final double unitPrice;
  final MPPayerDTO payer;
  final MPPaymentMethodsDTO? paymentMethods;

  MPPreferenceItemDTO(
      {required this.title,
      required this.quantity,
      required this.currencyId,
      required this.unitPrice,
      required this.payer,
      this.paymentMethods,
      });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "quantity": quantity,
      "currency_id": currencyId.currencyId,
      "unit_price": unitPrice,
      "payer": payer.toJson(),
      "payment_methods": paymentMethods?.toJson(),
    };
  }
}

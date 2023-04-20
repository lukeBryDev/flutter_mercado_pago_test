import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_currence_id_type.dart';
import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mpcategory_id_type.dart';

/// preference params. Visit https://www.mercadopago.com.co/developers/es/docs/checkout-pro-v1/configurations
class MPPreferenceItemDTO {
  final String id;
  final String title;
  final MPCategoryIdType categoryId;
  final int quantity;
  final MPCurrencyIdType currencyId;
  final double unitPrice;

  MPPreferenceItemDTO({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.quantity,
    required this.currencyId,
    required this.unitPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "category_id": categoryId.value,
      "quantity": quantity,
      "currency_id": currencyId.currencyId,
      "unit_price": unitPrice,
    };
  }
}

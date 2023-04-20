import 'package:mercado_pago_example/src/features/data/dtos/mp_payer_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_payment_methods_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_preference_item_dto.dart';

class MPPreferenceDTO {
  final List<MPPreferenceItemDTO> items;
  final MPPayerDTO payer;
  final MPPaymentMethodsDTO? paymentMethods;
  final String statementDescriptor;
  final String externalReference;
  final bool expires;
  final DateTime? expirationDateFrom;
  final DateTime? expirationDateTo;

  MPPreferenceDTO({
    required this.items,
    required this.payer,
    this.paymentMethods,
    required this.statementDescriptor,
    required this.externalReference,
    required this.expires,
    this.expirationDateFrom,
    this.expirationDateTo,
  });


  /// ```
  /// var example = {
  ///   "items": [
  ///     {
  ///       "id": "item-ID-1234",
  ///       "title":
  ///       "Title of what you are paying for. It will be displayed in the payment process.",
  ///       "currency_id": "COP",
  ///       "picture_url":
  ///       "https://www.mercadopago.com/org-img/MP3/home/logomp3.gif",
  ///       "description": "Item description",
  ///       "category_id": "art",
  ///       // Available categories at https://api.mercadopago.com/item_categories
  ///       "quantity": 1,
  ///       "unit_price": 100
  ///     }
  ///   ],
  ///   "payer": {
  ///     "name": "user-name",
  ///     "surname": "user-surname",
  ///     "email": "user@email.com",
  ///     "date_created": "2015-06-02T12:58:41.425-04:00",
  ///     "phone": {"area_code": "11", "number": "4444-4444"},
  ///     "identification": {
  ///       "type": "RUT",
  ///       // Available ID types at https://api.mercadopago.com/v1/identification_types
  ///       "number": "12345678"
  ///     },
  ///     "address": {
  ///       "street_name": "Street",
  ///       "street_number": 123,
  ///       "zip_code": "5700"
  ///     }
  ///   },
  ///   "back_urls": {
  ///     "success": "https://www.success.com",
  ///     "failure": "http://www.failure.com",
  ///     "pending": "http://www.pending.com"
  ///   },
  ///   "auto_return": "approved",
  ///   "payment_methods": {
  ///     "excluded_payment_methods": [
  ///       {"id": "master"}
  ///     ],
  ///     "excluded_payment_types": [
  ///       {"id": "ticket"}
  ///     ],
  ///     "installments": 12,
  ///     "default_payment_method_id": null,
  ///     "default_installments": null
  ///   },
  ///   "shipments": {
  ///     "receiver_address": {
  ///       "zip_code": "5700",
  ///       "street_number": 123,
  ///       "street_name": "Street",
  ///       "floor": 4,
  ///       "apartment": "C"
  ///     }
  ///   },
  ///   "notification_url": "https://www.your-site.com/ipn",
  ///   "statement_descriptor": "MINEGOCIO",
  ///   "external_reference": "Reference_1234",
  ///   "expires": true,
  ///   "expiration_date_from": "2016-02-01T12:00:00.000-04:00",
  ///   "expiration_date_to": "2016-02-28T12:00:00.000-04:00",
  ///   "taxes": [
  ///     {"type": "IVA", "value": 16}
  ///   ]
  /// };
  /// ```
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "items": items.map((e) => e.toJson()).toList(),
      "payer": payer.toJson(),
      "payment_methods": paymentMethods?.toJson(),
      "statement_descriptor": statementDescriptor,
      "external_reference": externalReference,
      "expires": expires,
    };
    if (expirationDateFrom != null) {
      json["expiration_date_from"] = expirationDateFrom;
    }
    if (expirationDateTo != null) json["expiration_date_to"] = expirationDateTo;
    return json;
  }
}

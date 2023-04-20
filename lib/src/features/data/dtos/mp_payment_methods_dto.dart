import 'package:mercado_pago_example/src/features/data/dtos/excluded_payment_dto.dart';
/// visit https://www.mercadopago.com.co/developers/es/docs/resources-faqs/payments#bookmark_los_medios_de_pago_no_aparecen_en_mi_checkout
class MPPaymentMethodsDTO {
  final List<ExcludedPaymentDTO>? excludedPaymentMethods;
  final List<ExcludedPaymentDTO>? excludedPaymentTypes;
  final int? installments;
  final String? defaultPaymentMethodId;
  final int? defaultInstallments;

  MPPaymentMethodsDTO({
    this.excludedPaymentMethods,
    this.excludedPaymentTypes,
    this.installments,
    this.defaultPaymentMethodId,
    this.defaultInstallments,
  });

  /// ```
  /// var example = {
  ///   "excluded_payment_methods": [
  ///     {"id": "master"}
  ///   ],
  ///   "excluded_payment_types": [
  ///     {"id": "ticket"}
  ///   ],
  ///   "installments": 12,
  ///   "default_payment_method_id": null,
  ///   "default_installments": null
  /// };
  /// ```
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    if (excludedPaymentMethods != null) {
      json["excluded_payment_methods"] =
          excludedPaymentMethods?.map((e) => e.toJson()).toList();
    }
    if (excludedPaymentTypes != null) {
      json["excluded_payment_types"] =
          excludedPaymentTypes?.map((e) => e.toJson()).toList();
    }
    if (installments != null) json["installments"] = installments;
    if (defaultPaymentMethodId != null) {
      json["default_payment_method_id"] = defaultPaymentMethodId;
    }
    if (defaultInstallments != null) {
      json["default_installments"] = defaultInstallments;
    }

    return json;
  }
}

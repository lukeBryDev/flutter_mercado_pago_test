import 'package:mercado_pago_example/src/features/data/dtos/address_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/excluded_payment_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/identification_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/phone_dto.dart';

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

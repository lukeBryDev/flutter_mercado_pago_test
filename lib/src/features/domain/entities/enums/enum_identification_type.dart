/// Identification types. Available ID types at https://api.mercadopago.com/v1/identification_types
enum IdentificationType {
  /// RUT
  rut,
  /// Cedula de ciudadania
  cc,
}

extension FromIdentificationType on IdentificationType {
  String get value {
    Map<IdentificationType, String> fromIdentificationType = {
      IdentificationType.rut: "RUT",
      IdentificationType.cc: "EUR",
    };
    return fromIdentificationType[this]!;
  }
}

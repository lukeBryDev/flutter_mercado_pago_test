/// country coins
enum MPCurrencyIdType {
  /// USA
  usd,

  /// Europe
  eur,

  /// Colombia
  cop,

  /// Mexico
  mxn,

  /// Argentina
  ars
}

extension FromMPCurrencyIdType on MPCurrencyIdType {
  String get currencyId {
    Map<MPCurrencyIdType, String> fromMPCurrencyIdType = {
      MPCurrencyIdType.usd: "USD",
      MPCurrencyIdType.eur: "EUR",
      MPCurrencyIdType.cop: "COP",
      MPCurrencyIdType.mxn: "MXN",
      MPCurrencyIdType.ars: "ARS",
    };
    return fromMPCurrencyIdType[this]!;
  }
}

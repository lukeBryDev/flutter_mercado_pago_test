class ExcludedPaymentDTO {
  final String id;

  ExcludedPaymentDTO({required this.id});

  Map<String, dynamic> toJson() {
    return {"id": id};
  }
}

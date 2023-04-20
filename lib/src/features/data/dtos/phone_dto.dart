class PhoneDTO {
  final int areaCode;
  final int number;

  PhoneDTO({required this.areaCode, required this.number});

  Map<String, dynamic> toJson() {
    return {"area_code": areaCode.toString(), "number": number.toString()};
  }
}

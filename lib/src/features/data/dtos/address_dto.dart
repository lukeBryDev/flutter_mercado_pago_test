class AddressDTO {
  final String streetName;
  final int streetNumber;
  final String zipCode;

  AddressDTO(
      {required this.streetName,
      required this.streetNumber,
      required this.zipCode});

  Map<String, dynamic> toJson() {
    return {
      "street_name": streetName,
      "street_number": streetNumber,
      "zip_code": zipCode
    };
  }
}

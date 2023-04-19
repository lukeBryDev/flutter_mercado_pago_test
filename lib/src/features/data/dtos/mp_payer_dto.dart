import 'package:mercado_pago_example/src/features/data/dtos/address_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/identification_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/phone_dto.dart';

class MPPayerDTO {
  final String? name;
  final String? surname;
  final String? email;
  final DateTime? dateCreated;
  final PhoneDTO? phone;
  final AddressDTO? address;
  final IdentificationDTO? identification;

  MPPayerDTO(
      {required this.name,
      this.surname,
      required this.email,
      this.dateCreated,
      this.phone,
      this.address,
      this.identification});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    if (name != null) json["name"] = name;
    if (surname != null) json["surname"] = surname;
    if (email != null) json["email"] = email;
    if (dateCreated != null) {
      json["date_created"] = dateCreated?.toIso8601String();
    }
    if (phone != null) json["phone"] = phone?.toJson();
    if (identification != null) json["identification"] = address?.toJson();
    if (address != null) json["address"] = identification?.toJson();
    return json;
  }
}

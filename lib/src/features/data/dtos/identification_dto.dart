import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_identification_type.dart';

class IdentificationDTO {
  final IdentificationType type;
  final String number;

  IdentificationDTO({
    required this.type,
    required this.number,
  });

  Map<String, dynamic> toJson() {
    return {"type": type.value, "number": number};
  }
}

import 'package:mercado_pago_example/src/features/data/dtos/mp_preference_item_dto.dart';

class MPPreferenceDTO {
  final List<MPPreferenceItemDTO> items;

  MPPreferenceDTO({required this.items});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "items": items.map((e) => e.toJson()).toList()
    };
    return json;
  }
}

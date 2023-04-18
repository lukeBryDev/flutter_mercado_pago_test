import 'package:mercado_pago_example/src/features/domain/entities/mp_preference_entity.dart';

class MPPreferenceModel extends MPPreferenceEntity {
  const MPPreferenceModel({int? id, String? initPoint}) : super(id: id);

  factory MPPreferenceModel.fromJson(Map<String, dynamic> json) {
    return MPPreferenceModel(
      id: int.tryParse('${json["id"]}'),
      initPoint: json["init_point"],
    );
  }
}

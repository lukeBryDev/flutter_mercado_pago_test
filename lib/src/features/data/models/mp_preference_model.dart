import 'package:mercado_pago_example/src/features/domain/entities/mp_preference_entity.dart';

class MPPreferenceModel extends MPPreferenceEntity {
  const MPPreferenceModel({String? id, String? initPoint, String? initPointSandbox})
      : super(id: id, initPoint: initPoint, initPointSandbox: initPointSandbox);

  factory MPPreferenceModel.fromJson(Map<String, dynamic> json) {
    return MPPreferenceModel(
      id: json["id"],
      initPoint: json["init_point"],
      initPointSandbox: json["sandbox_init_point"],
    );
  }
}

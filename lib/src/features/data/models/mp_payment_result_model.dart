import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_payment_status_type.dart';
import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_payment_status_detail_type.dart';
import 'package:mercado_pago_example/src/features/domain/entities/mp_payment_result_entity.dart';

class MPPaymentResultModel extends MPPaymentResultEntity {
  const MPPaymentResultModel(
      {String? message,
      String? id,
      MPPaymentStatusType? status,
      MPPaymentStatusDetailType? statusDetail})
      : super(
            message: message,
            id: id,
            status: status,
            statusDetail: statusDetail);

  factory MPPaymentResultModel.fromJson(Map<String, dynamic> json) {
    return MPPaymentResultModel(
      message: json["message"],
      id: json["paymentId"],
      status: (json["paymentStatus"]).runtimeType == String
          ? (json["paymentStatus"] as String).toMPStatus
          : null,
      statusDetail: (json["paymentStatusDetail"]).runtimeType == String
          ? (json["paymentStatusDetail"] as String).toMPStatusDetail
          : null,
    );
  }
}

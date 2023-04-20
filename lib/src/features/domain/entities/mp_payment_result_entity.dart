import 'package:equatable/equatable.dart';
import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_payment_status_type.dart';
import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_payment_status_detail_type.dart';

class MPPaymentResultEntity extends Equatable {
  final String? message;
  final String? id;
  final MPPaymentStatusType? status;
  final MPPaymentStatusDetailType? statusDetail;

  const MPPaymentResultEntity(
      {this.id, this.message, this.status, this.statusDetail});

  @override
  List<Object?> get props => [
        message,
        id,
        status,
        statusDetail,
      ];
}

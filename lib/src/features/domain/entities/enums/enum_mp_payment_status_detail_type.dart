import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_payment_status_type.dart';

enum MPPaymentStatusDetailType {
  accredited,
  pendingContingency,
  pendingReviewManual,
  ccRejectedBadFilledCardNumber,
  ccRejectedBadFilledDate,
  ccRejectedBadFilledOther,
  ccRejectedBadFilledSecurityCode,
  ccRejectedBlacklist,
  ccRejectedCallForAuthorize,
  ccRejectedCardDisabled,
  ccRejectedCardError,
  ccRejectedDuplicatedPayment,
  ccRejectedHighRisk,
  ccRejectedInsufficientAmount,
  ccRejectedInvalidInstallments,
  ccRejectedMaxAttempts,
  ccRejectedOtherReason,

  /// undefined
  undefined,
}

extension FromMPPaymentStatusDetail on MPPaymentStatusDetailType {
  MPPaymentStatusType? get mainStatus {
    Map<MPPaymentStatusDetailType, MPPaymentStatusType>
        fromMPPaymentStatusDetail = {
      MPPaymentStatusDetailType.accredited: MPPaymentStatusType.approved,
      MPPaymentStatusDetailType.pendingContingency:
          MPPaymentStatusType.inProcess,
      MPPaymentStatusDetailType.pendingReviewManual:
          MPPaymentStatusType.inProcess,
      MPPaymentStatusDetailType.ccRejectedBadFilledCardNumber:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedBadFilledDate:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedBadFilledOther:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedBadFilledSecurityCode:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedBlacklist:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedCallForAuthorize:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedCardDisabled:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedCardError:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedDuplicatedPayment:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedHighRisk:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedInsufficientAmount:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedInvalidInstallments:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedMaxAttempts:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.ccRejectedOtherReason:
          MPPaymentStatusType.rejected,
      MPPaymentStatusDetailType.undefined: MPPaymentStatusType.undefined,
    };
    return fromMPPaymentStatusDetail[this];
  }

  String? get message {
    Map<MPPaymentStatusDetailType, String> fromMPPaymentStatusDetail = {
      MPPaymentStatusDetailType.accredited:
          "¡Listo! Se acreditó tu pago. En tu resumen verás el cargo de amount como statement_descriptor.",
      MPPaymentStatusDetailType.pendingContingency:
          "Estamos procesando tu pago. \n No te preocupes, menos de 2 días hábiles te avisaremos por e-mail si se acreditó.",
      MPPaymentStatusDetailType.pendingReviewManual:
          "Estamos procesando tu pago. \n No te preocupes, menos de 2 días hábiles te avisaremos por e-mail si se acreditó o si necesitamos más información.",
      MPPaymentStatusDetailType.ccRejectedBadFilledCardNumber:
          "Revisa el número de tarjeta.",
      MPPaymentStatusDetailType.ccRejectedBadFilledDate:
          "Revisa la fecha de vencimiento.",
      MPPaymentStatusDetailType.ccRejectedBadFilledOther: "Revisa los datos.",
      MPPaymentStatusDetailType.ccRejectedBadFilledSecurityCode:
          "Revisa el código de seguridad de la tarjeta.",
      MPPaymentStatusDetailType.ccRejectedBlacklist:
          "No pudimos procesar tu pago.",
      MPPaymentStatusDetailType.ccRejectedCallForAuthorize:
          "Debes autorizar ante payment_method_id el pago de amount.",
      MPPaymentStatusDetailType.ccRejectedCardDisabled:
          "Llama a payment_method_id para activar tu tarjeta o usa otro medio de pago. El teléfono está al dorso de tu tarjeta.",
      MPPaymentStatusDetailType.ccRejectedCardError:
          "No pudimos procesar tu pago.",
      MPPaymentStatusDetailType.ccRejectedDuplicatedPayment:
          "Ya hiciste un pago por ese valor. \n Si necesitas volver a pagar usa otra tarjeta u otro medio de pago.",
      MPPaymentStatusDetailType.ccRejectedHighRisk:
          "Tu pago fue rechazado. \n Elige otro de los medios de pago, te recomendamos con medios en efectivo.",
      MPPaymentStatusDetailType.ccRejectedInsufficientAmount:
          "Tu payment_method_id no tiene fondos suficientes.",
      MPPaymentStatusDetailType.ccRejectedInvalidInstallments:
          "payment_method_id no procesa pagos en installments cuotas.",
      MPPaymentStatusDetailType.ccRejectedMaxAttempts:
          "legaste al límite de intentos permitidos. \n Elige otra tarjeta u otro medio de pago.",
      MPPaymentStatusDetailType.ccRejectedOtherReason:
          "payment_method_id noprocesó elpago.",
      MPPaymentStatusDetailType.undefined: "Indefinido",
    };
    if (fromMPPaymentStatusDetail[this] != null) {
      return fromMPPaymentStatusDetail[this];
    } else {
      return '';
    }
  }
}

extension ToMPPaymentStatusDetail on String {
  MPPaymentStatusDetailType? get toMPStatusDetail {
    Map<String, MPPaymentStatusDetailType> fromString = {
      "accredited": MPPaymentStatusDetailType.accredited,
      "pending_contingency": MPPaymentStatusDetailType.pendingContingency,
      "pending_review_manual": MPPaymentStatusDetailType.pendingReviewManual,
      "cc_rejected_bad_filled_card_number":
          MPPaymentStatusDetailType.ccRejectedBadFilledCardNumber,
      "cc_rejected_bad_filled_date":
          MPPaymentStatusDetailType.ccRejectedBadFilledDate,
      "cc_rejected_bad_filled_other":
          MPPaymentStatusDetailType.ccRejectedBadFilledOther,
      "cc_rejected_bad_filled_security_code":
          MPPaymentStatusDetailType.ccRejectedBadFilledSecurityCode,
      "cc_rejected_blacklist": MPPaymentStatusDetailType.ccRejectedBlacklist,
      "cc_rejected_call_for_authorize":
          MPPaymentStatusDetailType.ccRejectedCallForAuthorize,
      "cc_rejected_card_disabled":
          MPPaymentStatusDetailType.ccRejectedCardDisabled,
      "cc_rejected_card_error": MPPaymentStatusDetailType.ccRejectedCardError,
      "cc_rejected_duplicated_payment":
          MPPaymentStatusDetailType.ccRejectedDuplicatedPayment,
      "cc_rejected_high_risk": MPPaymentStatusDetailType.ccRejectedHighRisk,
      "cc_rejected_insufficient_amount":
          MPPaymentStatusDetailType.ccRejectedInsufficientAmount,
      "cc_rejected_invalid_installments":
          MPPaymentStatusDetailType.ccRejectedInvalidInstallments,
      "cc_rejected_max_attempts":
          MPPaymentStatusDetailType.ccRejectedMaxAttempts,
      "cc_rejected_other_reason":
          MPPaymentStatusDetailType.ccRejectedOtherReason,
    };
    if (fromString[this] != null) {
      if (fromString.containsKey(this)) {
        return fromString[this];
      } else {
        return MPPaymentStatusDetailType.undefined;
      }
    } else {
      return null;
    }
  }
}

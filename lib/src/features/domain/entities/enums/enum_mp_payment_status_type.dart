enum MPPaymentStatusType {
  approved,
  inProcess,
  rejected,

  /// undefined
  undefined,
}

extension FromMPPaymentStatus on MPPaymentStatusType {
  String? get label {
    Map<MPPaymentStatusType, String> fromMPPaymentStatusType = {
      MPPaymentStatusType.approved: "Approved",
      MPPaymentStatusType.inProcess: "In process",
      MPPaymentStatusType.rejected: "Rejected",
      MPPaymentStatusType.undefined: "Undefined",
    };
    return fromMPPaymentStatusType[this];
  }
}

extension ToMPPaymentStatus on String {
  MPPaymentStatusType? get toMPStatus {
    Map<String, MPPaymentStatusType> toMPPaymentStatus = {
      "approved": MPPaymentStatusType.approved,
      "in_process": MPPaymentStatusType.inProcess,
      "rejected": MPPaymentStatusType.rejected,
    };
    if (toMPPaymentStatus[this] != null) {
      if (toMPPaymentStatus.containsKey(this)) {
        return toMPPaymentStatus[this];
      } else {
        return MPPaymentStatusType.undefined;
      }
    } else {
      return null;
    }
  }
}

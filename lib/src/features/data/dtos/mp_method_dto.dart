class MPMethodDTO {
  final String? publicKey;
  final String? preferenceId;

  MPMethodDTO({required this.publicKey, required this.preferenceId});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (publicKey != null) json["publicKey"] = publicKey;
    if (preferenceId != null) json["preferenceId"] = preferenceId;
    return json;
  }
}

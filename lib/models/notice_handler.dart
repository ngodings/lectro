class DataValidationResponse {
  String? field;
  String? message;

  DataValidationResponse({
    this.field,
    this.message,
  });

  DataValidationResponse.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field'] = field;
    data['message'] = message;
    return data;
  }
}

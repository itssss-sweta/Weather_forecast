class ErrorModel {
  Error? error;

  ErrorModel({this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json["error"] == null ? null : Error.fromJson(json["error"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (error != null) {
      data["error"] = error?.toJson();
    }
    return data;
  }
}

class Error {
  int? code;
  String? message;

  Error({this.code, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["code"] = code;
    data["message"] = message;
    return data;
  }
}

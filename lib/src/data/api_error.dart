class ApiError {
  final int statusCode;
  final String message;
  final String? error; // Optional field for additional error details

  ApiError({required this.statusCode, required this.message, this.error});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] is Map
          ? json['message']['message'] ?? "Unknown error"
          : json['message'].toString(),
      error: json['message'] is Map ? json['message']['error'] : null,
    );
  }
}

class GeneralException implements Exception {
  GeneralException(this.message, [this.code]);

  final String message;
  final int? code;

  @override
  String toString() {
    if (code != null) {
      return 'CustomException: $message (Error code: $code)';
    } else {
      return 'CustomException: $message';
    }
  }
}

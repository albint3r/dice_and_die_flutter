class ErrorLoadingGamePlay implements Exception {
  ErrorLoadingGamePlay(this.message);

  final String message;

  @override
  String toString() {
    return "[ErrorLoadingGamePlay]: $message";
  }
}

class ErrorLoadingGamePlay implements Exception {
  ErrorLoadingGamePlay(this.message);

  final String message;

  @override
  String toString() {
    return "[ErrorLoadingGamePlay]: $message";
  }
}

class NoWinnerValidator implements Exception {
  NoWinnerValidator(this.message);

  final String message;

  @override
  String toString() {
    return "[NoWinnerValidator]: $message";
  }
}

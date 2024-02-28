class ErrorLoadingGamePlay implements Exception {
  ErrorLoadingGamePlay(this.message);

  final String message;

  @override
  String toString() {
    return "[ErrorLoadingGamePlay]: $message";
  }
}

class NoWinnerExistError implements Exception {
  NoWinnerExistError(this.message);

  final String message;

  @override
  String toString() {
    return "[NoWinnerValidator]: $message";
  }
}

class SoundGameError implements Exception {
  SoundGameError(this.message);

  final String message;

  @override
  String toString() {
    return "[SoundGameError]: $message";
  }
}

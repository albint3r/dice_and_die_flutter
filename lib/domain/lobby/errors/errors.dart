class ErrorLoadingActiveGames implements Exception {
  ErrorLoadingActiveGames(this.message);

  final String message;

  @override
  String toString() {
    return "[UnavailableLobbyActiveGames]: $message";
  }
}

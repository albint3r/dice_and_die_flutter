class ErrorFetchingUserRank implements Exception {
  ErrorFetchingUserRank(this.message);

  final String message;

  @override
  String toString() {
    return "[ErrorFetchingUserRank]: $message";
  }
}

class ErrorFetchingUsersRank implements Exception {
  ErrorFetchingUsersRank(this.message);

  final String message;

  @override
  String toString() {
    return "[ErrorFetchingUsersRank]: $message";
  }
}

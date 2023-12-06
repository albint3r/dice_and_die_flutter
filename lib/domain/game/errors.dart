class UnExistentGameError implements Exception {
  final String message;

  UnExistentGameError(this.message);

  @override
  String toString() => 'UnExistentGameError: $message';
}

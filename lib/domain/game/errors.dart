class UnExistentGameError implements Exception {
  final String message;

  UnExistentGameError(this.message);

  @override
  String toString() => 'UnExistentGameError: $message';
}

class SoundGameError implements Exception {
  final String message;

  SoundGameError(this.message);

  @override
  String toString() => 'SoundGameError: $message';
}

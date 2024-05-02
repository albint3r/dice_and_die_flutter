class ProfileError implements Exception {
  ProfileError(this.message);

  final String message;

  @override
  String toString() {
    return "[ProfileError]: $message";
  }
}

abstract interface class IProfileDataSource {
  Future<void> updateNameAndLastName(String name, String lastName);
}

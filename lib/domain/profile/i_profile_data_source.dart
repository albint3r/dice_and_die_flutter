import 'schemas/profile_response.dart';

abstract interface class IProfileDataSource {
  Future<String> updateName(String name);

  Future<ProfileResponse> getUserReferralProgram();
}

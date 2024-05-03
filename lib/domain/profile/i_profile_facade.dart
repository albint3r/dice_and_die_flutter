import 'package:reactive_forms/reactive_forms.dart';

import 'entities/referral_program.dart';

abstract interface class IProfileFacade {
  FormGroup get formGroup;

  String get name;

  Future<String> updateName(String name);

  Future<List<ReferralProgram>> getUserReferralProgram();
}

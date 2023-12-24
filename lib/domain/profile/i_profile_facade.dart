import 'package:reactive_forms/reactive_forms.dart';

abstract interface class IProfileFacade {
  FormGroup get formGroup;

  String get name;

  Future<String> updateName(String name);
}

import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/signup/i_signup_facade.dart';

@Injectable(as: ISignUpFacade)
class SignupFacadeImpl implements ISignUpFacade {
  final FormGroup _formGroup = FormGroup(
    {
      'email': FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      'name': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(4),
        ],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
          Validators.maxLength(20),
        ],
      ),
      'confirm password': FormControl<String>(),
      'referral code': FormControl<String>(),
    },
    validators: [
      Validators.mustMatch(
        'password',
        'confirm password',
      ),
    ],
  );

  @override
  FormGroup get formGroup => _formGroup;
}

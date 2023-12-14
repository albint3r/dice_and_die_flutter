import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms/src/models/models.dart';

import '../../domain/login/i_login_form_facade.dart';

@Injectable(as: ILoginFormFacade)
class LoginFormFacade implements ILoginFormFacade {
  final FormGroup _formGroup = FormGroup(
    {
      'email': FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
          Validators.maxLength(20),
        ],
      ),
      'confirm_password': FormControl<String>(),
    },
    validators: [
      Validators.mustMatch(
        'password',
        'confirm_password',
      ),
    ],
  );

  @override
  FormGroup get fromGroup => _formGroup;
}

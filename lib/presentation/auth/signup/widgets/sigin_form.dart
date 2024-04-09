import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/signin/signup_bloc.dart';
import '../../../../domain/auth/errors/auth_error.dart';
import '../../../core/design_system/forms/custom_type1_form.dart';
import '../../signup/widgets/email_field.dart';
import '../../signup/widgets/password_field.dart';
import 'confirm_password_field.dart';
import 'login_page_button.dart';
import 'name_field.dart';
import 'signin_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<SignupBloc>().state;
    final error = form.error;
    return CustomType1Form(
      formGroup: form.formGroup!,
      listFields: const [
        EmailField(),
        NameField(),
        PasswordField(),
        ConfirmPasswordField(),
      ],
      listButtons: const [
        SignInButton(),
        LoginPageButton(),
      ],
      showError: error?.type == AuthErrorType.logIn,
      textError: error?.errorMsg,
    );
  }
}

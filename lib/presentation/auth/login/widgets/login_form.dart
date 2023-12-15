import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/login/login_form_bloc.dart';
import '../../../../domain/auth/errors/auth_error.dart';
import '../../../core/design_system/forms/custom_type1_form.dart';
import '../../signup/widgets/email_field.dart';
import '../../signup/widgets/password_field.dart';
import 'go_signin_page_button.dart';
import 'login_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<LoginFormBloc>().state;
    final error = form.error;
    return CustomType1Form(
      formGroup: form.formGroup!,
      listFields: const [
        EmailField(),
        PasswordField(),
      ],
      listButtons: const [
        LogInButton(),
        GoSignInPageButton(),
      ],
      showError: error?.type == AuthErrorType.logIn,
      textError: error?.errorMsg,
    );
  }
}

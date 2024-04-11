import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../application/login/login_form_bloc.dart';
import '../../../../domain/auth/errors/auth_error.dart';
import '../../../core/design_system/forms/custom_type1_form.dart';
import '../../../core/theme/const_values.dart';
import '../../signup/widgets/email_field.dart';
import '../../signup/widgets/password_field.dart';
import 'go_signin_page_button.dart';
import 'login_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context
        .watch<LoginFormBloc>()
        .state;
    final error = form.error;
    return CustomType1Form(
      formGroup: form.formGroup!,
      listFields: const [
        EmailField(),
        PasswordField(),
      ],
      listButtons: [
        LogInButton(),
        Gap(padding),
        Text('Or continue with'),
        Gap(padding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(child: Container(color: Colors.white70, height: 75, width: 75, child: Icon(Icons.g_mobiledata_outlined, color: Colors.red, size: 50),)),
            Gap(20),
            Card(child: Container(color: Colors.white70, height: 75, width: 75, child: Icon(Icons.g_mobiledata_outlined, color: Colors.red, size: 50),)),
          ],
        ),
        Gap(padding),
        GoSignInPageButton(),
      ],
      showError: error?.type == AuthErrorType.logIn,
      textError: error?.errorMsg,
    );
  }
}

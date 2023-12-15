import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/login/login_form_bloc.dart';
import '../../../../domain/auth/errors/auth_error.dart';

import '../../../core/design_system/buttons/custom_long_button.dart';
import '../../../core/design_system/form_fields/custom_app_text_field.dart';
import '../../../core/router/app_router.dart';
import '../../signup/widgets/email_field.dart';
import '../../signup/widgets/password_field.dart';
import 'login_button.dart';

class BodyLogIn extends StatelessWidget {
  const BodyLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;

    final form = context.watch<LoginFormBloc>().state;
    final error = form.error;
    if (auth.isLoading || form.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ReactiveForm(
      formGroup: form.formGroup!,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EmailField(),
              const PasswordField(),
              if (error?.type == AuthErrorType.logIn) Text(error!.errorMsg),
              const LogInButton(),
              TextButton(
                onPressed: () => context.router.replaceAll([
                  const SignUpRoute(),
                ]),
                child: const Text('Go to SignIn'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

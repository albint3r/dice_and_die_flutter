import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/login/login_form_bloc.dart';
import '../../../core/design_system/buttons/custom_long_button.dart';

class BodyLogIn extends StatelessWidget {
  const BodyLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final form = context.watch<LoginFormBloc>().state;
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
              ReactiveTextField(
                formControlName: 'email',
              ),
              ReactiveTextField(
                formControlName: 'password',
                obscureText: true,
              ),
              ReactiveTextField(
                formControlName: 'confirm_password',
                obscureText: true,
              ),
              ReactiveFormConsumer(
                builder: (context, form, _) {
                  return CustomLongButton(
                    text: 'Create Account',
                    // User Add the data to the Auth event
                    // Email and Password
                    onPressed: form.valid
                        ? () => context.read<AuthBloc>().add(
                              AuthEvent.sigInWithEmailAndPassword(
                                form.rawValue,
                              ),
                            )
                        : null,
                    width: 300,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

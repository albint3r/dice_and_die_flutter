import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/signin/signup_bloc.dart';
import '../../../core/design_system/forms/custom_form_consumer_btn.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SignupBloc>().state;
    final form = state.formGroup;
    return CustomFormConsumeBtn(
      text: 'Signing Account',
      width: 300,
      onPress: () => context.read<AuthBloc>().add(
            AuthEvent.sigInWithEmailAndPassword(
              form!.rawValue,
            ),
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/login/login_form_bloc.dart';
import '../../../core/design_system/forms/custom_form_consumer_btn.dart';
import '../../../core/theme/const_values.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginFormBloc>().state;
    final form = state.formGroup;
    return CustomFormConsumeBtn(
      text: 'Login Account',
      width: waitingRoomCardWidth,
      onPress: () => context.read<AuthBloc>().add(
            AuthEvent.logInWithEmailAndPassword(
              form!.rawValue,
            ),
          ),
    );
  }
}

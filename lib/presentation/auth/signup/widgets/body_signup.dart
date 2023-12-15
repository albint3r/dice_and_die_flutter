import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/signin/signup_bloc.dart';
import '../../login/widgets/name_logo.dart';
import 'sigin_form.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final form = context.watch<SignupBloc>().state;
    final auth = context.watch<AuthBloc>().state;
    if (auth.isLoading || form.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Column(
      children: [
        NameLogo(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(
              8.0,
            ),
            child: SignInForm(),
          ),
        ),
      ],
    );
  }
}

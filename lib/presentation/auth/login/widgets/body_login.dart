import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/login/login_form_bloc.dart';
import '../../../core/design_system/text/titleh1.dart';
import 'login_form.dart';
import 'name_logo.dart';

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
    return const Column(
      children: [
        NameLogo(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(
              8.0,
            ),
            child: LoginForm(),
          ),
        ),
      ],
    );
  }
}

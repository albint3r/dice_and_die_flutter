import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/login/login_form_bloc.dart';
import '../../../domain/auth/errors/auth_error.dart';
import '../../../injectables.dart';
import 'widgets/body_login.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginFormBloc>()
        ..add(
          const LoginFormEvent.started(),
        ),
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (pre, curr) =>
            pre.error != curr.error && curr.error?.type == AuthErrorType.logIn,
        listener: (context, state) => context.read<LoginFormBloc>().add(
              LoginFormEvent.setError(
                state.error!,
              ),
            ),
        child: const SafeArea(
          child: Scaffold(
            body: BodyLogIn(),
          ),
        ),
      ),
    );
  }
}

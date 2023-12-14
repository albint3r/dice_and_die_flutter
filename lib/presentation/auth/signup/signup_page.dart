import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/signin/signup_bloc.dart';
import '../../../injectables.dart';
import 'widgets/body_signup.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupBloc>()
        ..add(
          const SignupEvent.started(),
        ),
      child: const SafeArea(
        child: Scaffold(
          body: BodySignUp(),
        ),
      ),
    );
  }
}

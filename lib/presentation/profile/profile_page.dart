import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_bloc.dart';
import '../../application/profile/profile_bloc.dart';
import '../../injectables.dart';
import '../core/design_system/app_bar/custom_app_bar.dart';
import 'widgets/body_profile.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()
        ..add(
          const ProfileEvent.started(),
        ),
      // This Listener update only the name of the App User
      child: BlocListener<ProfileBloc, ProfileState>(
        listenWhen: (pre, curr) =>
            pre.newUserName != curr.newUserName && curr.newUserName.isNotEmpty,
        listener: (context, state) => context.read<AuthBloc>().add(
              AuthEvent.updateUserName(
                state.newUserName,
              ),
            ),
        child: SafeArea(
          child: Scaffold(
            appBar: CustomAppBar(
              title: 'Account',
              icon: Icons.arrow_back,
              onPress: () => context.router.pop(),
            ),
            body: const BodyProfile(),
          ),
        ),
      ),
    );
  }
}

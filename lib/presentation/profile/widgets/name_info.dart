import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/profile/profile_bloc.dart';
import '../../../domain/auth/app_user.dart';
import '../../core/design_system/buttons/custom_text_button.dart';
import '../../core/design_system/text/text_body.dart';

class NameInfo extends StatelessWidget {
  const NameInfo({super.key});

  String _displayNameFormat(AppUser appUser) {
    if (appUser.name.isNotEmpty) {
      return appUser.name;
    }
    return "No Name";
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final appUser = auth.appUser;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextBody(_displayNameFormat(appUser!)),
        CustomTextButton(
          text: 'Edit',
          onPressed: () => context.read<ProfileBloc>().add(
                const ProfileEvent.isEditing(),
              ),
        ),
      ],
    );
  }
}

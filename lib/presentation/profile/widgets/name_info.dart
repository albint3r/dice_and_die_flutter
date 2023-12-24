import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/profile/profile_bloc.dart';
import '../../../domain/auth/app_user.dart';
import '../../core/design_system/buttons/custom_text_button.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';

class NameInfo extends StatelessWidget {
  const NameInfo({super.key});

  String _displayNameFormat(AppUser appUser) {
    if (appUser.name.isNotEmpty) {
      return appUser.name;
    }
    return "No Name";
  }

  Widget _getStaticBox(Widget widget) {
    return SizedBox(
      height: inputFieldHeightStaticBox,
      child: Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: inputFieldHeight,
          child: Center(
            child: widget,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final appUser = auth.appUser;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getStaticBox(
          TitleH2(
            _displayNameFormat(appUser!),
          ),
        ),
        _getStaticBox(
          CustomTextButton(
            text: 'Edit',
            onPressed: () => context.read<ProfileBloc>().add(
                  const ProfileEvent.isEditing(),
                ),
          ),
        ),
      ],
    );
  }
}

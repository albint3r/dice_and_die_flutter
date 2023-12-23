import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/profile/profile_bloc.dart';
import '../../../domain/auth/app_user.dart';
import '../../core/design_system/buttons/custom_text_button.dart';
import '../../core/design_system/form_fields/custom_app_text_field.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh2.dart';

class AccountNameField extends StatelessWidget {
  const AccountNameField({super.key});

  String _displayFormatedName(AppUser appUser) {
    if (appUser.name.isNotEmpty) {
      return appUser.name;
    }
    return "No Name";
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final appUser = auth.appUser;
    final form = context.watch<ProfileBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleH2('User Name:'),
        if (form.isEditing)
          ReactiveForm(
            formGroup: form.formGroup!,
            child: CustomAppTexTField(
              formControlName: 'name',
              hintText: 'name',
              suffixIcon: IconButton(
                onPressed: () => context.read<ProfileBloc>().add(
                      const ProfileEvent.sendChange(),
                    ),
                icon: const Icon(Icons.send),
              ),
            ),
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBody(_displayFormatedName(appUser!)),
              CustomTextButton(
                text: 'Edit',
                onPressed: () => context.read<ProfileBloc>().add(
                      const ProfileEvent.isEditing(),
                    ),
              ),
            ],
          ),
      ],
    );
  }
}

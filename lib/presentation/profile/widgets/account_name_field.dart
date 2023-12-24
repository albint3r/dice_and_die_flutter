import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/profile/profile_bloc.dart';
import '../../core/design_system/form_fields/custom_app_text_field.dart';
import '../../core/design_system/text/titleh2.dart';
import 'name_info.dart';

class AccountNameField extends StatelessWidget {
  const AccountNameField({super.key});

  @override
  Widget build(BuildContext context) {
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
          const NameInfo(),
      ],
    );
  }
}

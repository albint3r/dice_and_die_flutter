import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../application/profile/profile_bloc.dart';
import '../../core/design_system/form_fields/custom_app_text_field.dart';
import '../../core/design_system/text/titleh2.dart';
import '../../core/theme/const_values.dart';
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
        const Gap(padding),
        // If the user click to edit it will show the textfield.
        if (form.isEditing)
          ReactiveForm(
            formGroup: form.formGroup!,
            child: CustomAppTexTField(
              formControlName: 'name',
              hintText: 'name',
              suffixIcon: ReactiveFormConsumer(
                builder: (_, form, __) {
                  return IconButton(
                    onPressed: form.valid
                        ? () => context.read<ProfileBloc>().add(
                              const ProfileEvent.sendChange(),
                            )
                        : null,
                    icon: const Icon(Icons.send),
                  );
                },
              ),
            ),
          )
        else
          const NameInfo(),
      ],
    );
  }
}

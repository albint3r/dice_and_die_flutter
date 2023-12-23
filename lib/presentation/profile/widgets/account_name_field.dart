import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../core/design_system/buttons/custom_text_button.dart';
import '../../core/design_system/text/text_body.dart';
import '../../core/design_system/text/titleh2.dart';

class AccountNameField extends StatelessWidget {
  const AccountNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthBloc>().state;
    final appUser = auth.appUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleH2('User Name:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBody('${appUser!.name} ${appUser.lastName}'),
            CustomTextButton(text: 'Edit',
            onPressed: () => null,)
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/design_system/form_fields/custom_app_text_field.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppTexTField(
      formControlName: 'password',
      obscureText: true,
      suffixIcon: Icon(Icons.password),
    );
  }
}

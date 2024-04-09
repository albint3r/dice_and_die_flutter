import 'package:flutter/material.dart';

import '../../../core/design_system/form_fields/custom_app_text_field.dart';

class NameField extends StatelessWidget {
  const NameField();

  @override
  Widget build(BuildContext context) {
    return const CustomAppTexTField(
      formControlName: 'name',
      suffixIcon: Icon(Icons.person),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/design_system/form_fields/custom_app_text_field.dart';

class ReferralCodeField extends StatelessWidget {
  const ReferralCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppTexTField(
      formControlName: 'referral code',
      hintText: 'Optional',
      suffixIcon: Icon(Icons.qr_code_scanner),
    );
  }
}

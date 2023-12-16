import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../theme/const_values.dart';
import '../text/titleh1.dart';

class CustomType1Form extends StatelessWidget {
  const CustomType1Form({
    required this.formGroup,
    required this.listFields,
    required this.listButtons,
    this.textError,
    this.showError = false,
    super.key,
  });

  final FormGroup formGroup;
  final List<Widget> listFields;
  final List<Widget> listButtons;
  final String? textError;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return ReactiveForm(
      formGroup: formGroup,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: listFields,
              ),
            ),
            if (showError) ...[
              TitleH1(
                text: textError ?? '',
                color: colorScheme.error,
                fontSize: h2,
              ),
              const Gap(padding),
            ],
            ...listButtons,
          ],
        ),
      ),
    );
  }
}

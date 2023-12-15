import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
    return ReactiveForm(
      formGroup: formGroup,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: listFields,
              ),
            ),
            if (showError) Text(textError ?? ''),
            ...listButtons,
          ],
        ),
      ),
    );
  }
}

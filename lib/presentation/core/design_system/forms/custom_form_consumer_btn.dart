import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../buttons/custom_long_button.dart';

class CustomFormConsumeBtn extends StatelessWidget {
  const CustomFormConsumeBtn({
    required this.text,
    required this.width,
    this.onPress,
    super.key,
  });

  final String text;
  final double width;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (_, form, __) {
        return CustomLongButton(
          text: text,
          onPressed: form.valid ? onPress : null,
          width: width,
        );
      },
    );
  }
}

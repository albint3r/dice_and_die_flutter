import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomAppTexTField extends StatelessWidget {
  const CustomAppTexTField({
    required this.formControlName,
    this.hintText = '',
    this.obscureText = false,
    this.suffixIcon,
    super.key,
  });

  final String formControlName;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    //The size box create the effect to hacker the field. When the
    // error field appears don't move up the field,
    // because is inside this space.
    return SizedBox(
      height: 90,
      child: ReactiveTextField(
        formControlName: formControlName,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: formControlName,
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

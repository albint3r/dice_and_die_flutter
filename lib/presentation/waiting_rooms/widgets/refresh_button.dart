import 'package:flutter/material.dart';

import '../../core/design_system/buttons/custom_short_buttom.dart';


class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomShortButton(icon: Icons.refresh);
  }
}

import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class NameLogo extends StatelessWidget {
  const NameLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: CircleAvatar(
        backgroundImage: Assets.appLogo.provider(),
        maxRadius: 75,
        minRadius: 30,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../core/theme/const_values.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: colorScheme.onSecondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: Assets.defaultAvatar.image(),
    );
  }
}

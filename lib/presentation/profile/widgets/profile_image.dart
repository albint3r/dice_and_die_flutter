import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../core/theme/const_values.dart';

const boxAvatarSize = 250.0;

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    this.width = boxAvatarSize,
    this.height = boxAvatarSize,
    this.color,
    this.radius,
  });

  final double width;
  final double height;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? colorScheme.onSecondary,
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? borderRadius),
        ),
      ),
      child: Assets.defaultAvatar.image(),
    );
  }
}

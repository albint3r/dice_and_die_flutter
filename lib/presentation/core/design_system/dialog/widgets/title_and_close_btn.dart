import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../buttons/custom_short_buttom.dart';
import 'title_container.dart';

class TitleAndCloseBtn extends StatelessWidget {
  const TitleAndCloseBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: TitleContainer(),
        ),
        const Gap(20),
        CustomShortButton(
          icon: Icons.close,
          onPressed: () => context.router.pop(),
        )
      ],
    );
  }
}

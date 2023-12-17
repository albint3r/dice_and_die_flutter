import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/buttons_container.dart';
import 'widgets/title_and_close_btn.dart';

abstract class MenuSize {
  static double get horizontalPadding => .05;
  static double get verticalPadding => .1;
}

class CustomDialogMenu extends StatelessWidget {
  const CustomDialogMenu({super.key});

  BoxDecoration _boxDecoration(Color backgroundColor, Color borderColor) =>
      BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: borderColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * MenuSize.horizontalPadding,
        vertical: height * MenuSize.verticalPadding,
      ),
      child: Container(
        decoration:
            _boxDecoration(colorScheme.background, colorScheme.onPrimary),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            decoration: _boxDecoration(
              colorScheme.surface,
              colorScheme.surface.withOpacity(.5),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20,
              ),
              child: Column(
                children: [
                  TitleAndCloseBtn(),
                  Gap(5),
                  Expanded(
                    child: ButtonsContainer(),
                  ),
                  Gap(25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

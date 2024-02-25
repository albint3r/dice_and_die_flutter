import 'package:flutter/material.dart';

import '../../../core/design_system/text/text_body.dart';

class TurnPlayerIndicator extends StatelessWidget {
  const TurnPlayerIndicator({
    this.isTurn = true,
    this.reverse = false,
  });

  final bool isTurn;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    const arrowSize = 40.0;
    if (isTurn) {
      return Expanded(
        child: Row(
          mainAxisAlignment:
              reverse ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (reverse)
              Icon(
                Icons.arrow_back_ios_outlined,
                color: colorScheme.primary,
                size: arrowSize,
              ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.primary,
                ),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.transparent,
                foregroundColor: colorScheme.primary,
                child: const TextBody(
                  'Select column',
                  maxLines: 2,
                  fontSize: 8,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (!reverse)
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: colorScheme.primary,
                size: arrowSize,
              ),
          ],
        ),
      );
    }
    return const Expanded(child: SizedBox());
  }
}

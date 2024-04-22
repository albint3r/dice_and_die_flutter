import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'widgets/body_how_to_play.dart';

@RoutePage()
class HowToPlayPage extends StatelessWidget {
  const HowToPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BodyHowToPlay(),
      ),
    );
  }
}

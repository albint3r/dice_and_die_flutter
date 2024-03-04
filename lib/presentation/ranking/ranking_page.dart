import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/design_system/app_bar/custom_app_bar.dart';
import 'widgets/body_ranking.dart';

@RoutePage()
class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Ranking',
          icon: Icons.arrow_back,
          onPress: () => context.router.pop(),
        ),
        body: const BodyRanking(),
      ),
    );
  }
}

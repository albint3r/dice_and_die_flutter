import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/design_system/app_bar/custom_app_bar.dart';
import 'widgets/body_profile.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Battle Arena',
          icon: Icons.arrow_back,
          onPress: () => context.router.pop(),
        ),
        body: const BodyProfile(),
      ),
    );
  }
}

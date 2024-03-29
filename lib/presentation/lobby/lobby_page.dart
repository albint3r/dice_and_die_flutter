import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/design_system/app_bar/custom_app_bar.dart';
import '../core/design_system/dialog/custom_dialog_menu.dart';
import 'widgets/body_lobby.dart';

@RoutePage()
class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Lobby Games',
          icon: Icons.menu,
          onPress: () {
            showDialog(
              context: context,
              builder: (context) {
                return const CustomDialogMenu();
              },
            );
          },
        ),
        body: const BodyLobby(),
      ),
    );
  }
}

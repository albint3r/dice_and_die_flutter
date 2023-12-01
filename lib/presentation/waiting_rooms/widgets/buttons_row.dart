import 'package:auto_route/auto_route.dart';
import 'package:dice_and_die_flutter/presentation/waiting_rooms/widgets/refresh_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/design_system/buttons/custom_long_button.dart';
import '../../core/design_system/buttons/custom_short_buttom.dart';
import '../../core/router/app_router.dart';
import 'create_game_button.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CreateGameButton(),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: RefreshIconButton(),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/waiting_room/waiting_room_bloc.dart';
import '../../core/design_system/buttons/custom_short_buttom.dart';

class RefreshIconButton extends StatelessWidget {
  const RefreshIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShortButton.secondary(
      Icons.refresh,
      onPressed: () => context.read<WaitingRoomBloc>().add(
            const WaitingRoomEvent.reloadEvents(),
          ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/waiting_room/game.dart';
import '../../game/game_page.dart';
import '../../waiting_rooms/waiting_rooms_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: WaitingRoomsRoute.page,
        ),
        AutoRoute(
          page: GameRoute.page,
        ),
      ];
}

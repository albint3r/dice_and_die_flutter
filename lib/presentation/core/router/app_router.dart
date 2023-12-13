import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../../../domain/waiting_room/game.dart';
import '../../auth/login/login_page.dart';
import '../../game/game_page.dart';
import '../../waiting_rooms/waiting_rooms_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WaitingRoomsRoute.page,
        ),
        AutoRoute(
          page: GameRoute.page,
        ),
        AutoRoute(
          initial: true,
          page: LoginRoute.page,
        ),
      ];

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (kDebugMode) {
      l.d('.' * 50);
      l.d('Current Page :" [${router.current.name}]  to Next Page -> [${resolver.route.name}]');
      l.d('.' * 50);
    }
    if (true || resolver.route.name == LoginRoute.name) {
      resolver.next();
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../domain/auth/app_user.dart';
import '../../../domain/game_play/entities/game.dart';
import '../../../domain/game_play/entities/player.dart';
import '../../../domain/game_play/enums/match_type.dart';
import '../../auth/login/login_page.dart';
import '../../auth/signup/signup_page.dart';
import '../../game_play/create_or_join_game_page.dart';
import '../../how_to_play/how_to_play_page.dart';
import '../../lobby/lobby_page.dart';
import '../../podium_area/podium_page.dart';
import '../../profile/profile_page.dart';
import '../../ranking/ranking_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter(this._auth);

  final AuthBloc _auth;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: LobbyRoute.page,
        ),
        AutoRoute(
          page: CreateOrJoinGameRoute.page,
        ),
        AutoRoute(
          page: PodiumRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: ProfileRoute.page,
        ),
        AutoRoute(
          page: RankingRoute.page,
        ),
        AutoRoute(
          page: HowToPlayRoute.page,
        ),
      ];

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (kDebugMode) {
      l.d('.' * 50);
      l.d('Current Page :" [${router.current.name}]  to Next Page -> [${resolver.route.name}]');
      l.d('.' * 50);
    }
    final appUser = _auth.state.appUser;
    final sessionToken = _auth.state.sessionToken;
    if ((appUser is AppUser && sessionToken.isNotEmpty) ||
        resolver.route.name == LoginRoute.name ||
        resolver.route.name == SignUpRoute.name) {
      resolver.next();
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}

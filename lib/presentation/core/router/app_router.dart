import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:l/l.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../domain/auth/app_user.dart';
import '../../../domain/game_play/entities/game.dart';
import '../../../domain/game_play/entities/player.dart';
import '../../auth/login/login_page.dart';
import '../../auth/signup/signup_page.dart';
import '../../game_play/challenge_friend_page.dart';
import '../../game_play/create_or_join_game_page.dart';
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
          page: ChallengeFriendRoute.page,
          path: '/game-friend/:id',
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
      ];

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (kDebugMode) {
      l.d('.' * 50);
      l.d('Current Page :" [${router.current.name}]  to Next Page -> [${resolver.route.name}]');
      l.d('pathParams :" [${resolver.route.pathParams}]');
      l.d('path :" [${resolver.route.path}]');
      l.d('routeName :" [${resolver.routeName}]');
      l.d('route :" [${resolver.route}]');
      l.d('.' * 50);
    }
    final appUser = _auth.state.appUser;
    final sessionToken = _auth.state.sessionToken;
    final resolveRouteName = resolver.route.name;
    final isUser = appUser is AppUser;
    final isToken = sessionToken.isNotEmpty;
    if ((isUser && isToken) ||
        resolveRouteName == LoginRoute.name ||
        resolveRouteName == SignUpRoute.name ||
        resolveRouteName == ChallengeFriendRoute.name) {
      resolver.next();
    } else {
      resolver.redirect(const LoginRoute());
    }
  }
}

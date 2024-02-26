// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreateGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateGamePage(),
      );
    },
    JoinGameRoute.name: (routeData) {
      final args = routeData.argsAs<JoinGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: JoinGamePage(game: args.game),
      );
    },
    LobbyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LobbyPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    PodiumRoute.name: (routeData) {
      final args = routeData.argsAs<PodiumRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PodiumPage(
          player: args.player,
          opponentPlayer: args.opponentPlayer,
          winnerPlayer: args.winnerPlayer,
          game: args.game,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
  };
}

/// generated route for
/// [CreateGamePage]
class CreateGameRoute extends PageRouteInfo<void> {
  const CreateGameRoute({List<PageRouteInfo>? children})
      : super(
          CreateGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinGamePage]
class JoinGameRoute extends PageRouteInfo<JoinGameRouteArgs> {
  JoinGameRoute({
    required Game game,
    List<PageRouteInfo>? children,
  }) : super(
          JoinGameRoute.name,
          args: JoinGameRouteArgs(game: game),
          initialChildren: children,
        );

  static const String name = 'JoinGameRoute';

  static const PageInfo<JoinGameRouteArgs> page =
      PageInfo<JoinGameRouteArgs>(name);
}

class JoinGameRouteArgs {
  const JoinGameRouteArgs({required this.game});

  final Game game;

  @override
  String toString() {
    return 'JoinGameRouteArgs{game: $game}';
  }
}

/// generated route for
/// [LobbyPage]
class LobbyRoute extends PageRouteInfo<void> {
  const LobbyRoute({List<PageRouteInfo>? children})
      : super(
          LobbyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LobbyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PodiumPage]
class PodiumRoute extends PageRouteInfo<PodiumRouteArgs> {
  PodiumRoute({
    required Player player,
    required Player opponentPlayer,
    required (Player, Player?) winnerPlayer,
    required Game game,
    List<PageRouteInfo>? children,
  }) : super(
          PodiumRoute.name,
          args: PodiumRouteArgs(
            player: player,
            opponentPlayer: opponentPlayer,
            winnerPlayer: winnerPlayer,
            game: game,
          ),
          initialChildren: children,
        );

  static const String name = 'PodiumRoute';

  static const PageInfo<PodiumRouteArgs> page = PageInfo<PodiumRouteArgs>(name);
}

class PodiumRouteArgs {
  const PodiumRouteArgs({
    required this.player,
    required this.opponentPlayer,
    required this.winnerPlayer,
    required this.game,
  });

  final Player player;

  final Player opponentPlayer;

  final (Player, Player?) winnerPlayer;

  final Game game;

  @override
  String toString() {
    return 'PodiumRouteArgs{player: $player, opponentPlayer: $opponentPlayer, winnerPlayer: $winnerPlayer, game: $game}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

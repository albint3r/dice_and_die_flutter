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
    GameRoute.name: (routeData) {
      final args =
          routeData.argsAs<GameRouteArgs>(orElse: () => const GameRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GamePage(game: args.game),
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
    WaitingRoomsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WaitingRoomsPage(),
      );
    },
  };
}

/// generated route for
/// [GamePage]
class GameRoute extends PageRouteInfo<GameRouteArgs> {
  GameRoute({
    Game? game,
    List<PageRouteInfo>? children,
  }) : super(
          GameRoute.name,
          args: GameRouteArgs(game: game),
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<GameRouteArgs> page = PageInfo<GameRouteArgs>(name);
}

class GameRouteArgs {
  const GameRouteArgs({this.game});

  final Game? game;

  @override
  String toString() {
    return 'GameRouteArgs{game: $game}';
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

/// generated route for
/// [WaitingRoomsPage]
class WaitingRoomsRoute extends PageRouteInfo<void> {
  const WaitingRoomsRoute({List<PageRouteInfo>? children})
      : super(
          WaitingRoomsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WaitingRoomsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

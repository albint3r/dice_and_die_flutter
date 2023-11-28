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

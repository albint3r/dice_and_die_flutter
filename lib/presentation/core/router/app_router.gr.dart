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
    ChallengeFriendRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ChallengeFriendRouteArgs>(
          orElse: () =>
              ChallengeFriendRouteArgs(gameId: pathParams.getString('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChallengeFriendPage(gameId: args.gameId),
      );
    },
    CreateOrJoinGameRoute.name: (routeData) {
      final args = routeData.argsAs<CreateOrJoinGameRouteArgs>(
          orElse: () => const CreateOrJoinGameRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateOrJoinGamePage(game: args.game),
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
    RankingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RankingPage(),
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
/// [ChallengeFriendPage]
class ChallengeFriendRoute extends PageRouteInfo<ChallengeFriendRouteArgs> {
  ChallengeFriendRoute({
    required String gameId,
    List<PageRouteInfo>? children,
  }) : super(
          ChallengeFriendRoute.name,
          args: ChallengeFriendRouteArgs(gameId: gameId),
          rawPathParams: {'id': gameId},
          initialChildren: children,
        );

  static const String name = 'ChallengeFriendRoute';

  static const PageInfo<ChallengeFriendRouteArgs> page =
      PageInfo<ChallengeFriendRouteArgs>(name);
}

class ChallengeFriendRouteArgs {
  const ChallengeFriendRouteArgs({required this.gameId});

  final String gameId;

  @override
  String toString() {
    return 'ChallengeFriendRouteArgs{gameId: $gameId}';
  }
}

/// generated route for
/// [CreateOrJoinGamePage]
class CreateOrJoinGameRoute extends PageRouteInfo<CreateOrJoinGameRouteArgs> {
  CreateOrJoinGameRoute({
    Game? game,
    List<PageRouteInfo>? children,
  }) : super(
          CreateOrJoinGameRoute.name,
          args: CreateOrJoinGameRouteArgs(game: game),
          initialChildren: children,
        );

  static const String name = 'CreateOrJoinGameRoute';

  static const PageInfo<CreateOrJoinGameRouteArgs> page =
      PageInfo<CreateOrJoinGameRouteArgs>(name);
}

class CreateOrJoinGameRouteArgs {
  const CreateOrJoinGameRouteArgs({this.game});

  final Game? game;

  @override
  String toString() {
    return 'CreateOrJoinGameRouteArgs{game: $game}';
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
/// [RankingPage]
class RankingRoute extends PageRouteInfo<void> {
  const RankingRoute({List<PageRouteInfo>? children})
      : super(
          RankingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RankingRoute';

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

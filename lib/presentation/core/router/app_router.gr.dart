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
    WaitingRoomsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WaitingRoomsPage(),
      );
    }
  };
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

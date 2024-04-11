import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meeseeks/layouts/nav.layout.dart';
import 'package:meeseeks/screens/screens.dart';

part 'routes.router.g.dart';

/// The key of the router root
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// The key of the navigation's ShellRoute
final _sheelNavKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@TypedShellRoute<RootShell>(
  routes: [
    TypedShellRoute<NavShell>(
      routes: [
        TypedGoRoute<CharactersRoute>(
          path: '/character',
          routes: [
            TypedGoRoute<LocationsRoute>(path: 'location'),
            TypedGoRoute<EpisodesRoute>(path: 'episode'),
          ],
        ),
      ],
    ),
  ],
)
class RootShell extends ShellRouteData {
  const RootShell();

  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;

  @override
  Widget builder(context, state, navigator) => LoadingScreen(key: state.pageKey, child: navigator);
}

class NavShell extends ShellRouteData {
  const NavShell();

  static final GlobalKey<NavigatorState> $navigatorKey = _sheelNavKey;

  @override
  Widget builder(context, state, navigator) => NavLayout(key: state.pageKey, child: navigator);
}

class CharactersRoute extends GoRouteData {
  @override
  Widget build(context, state) => CharactersScreen(key: state.pageKey);
}

class LocationsRoute extends GoRouteData {
  @override
  Widget build(context, state) => LocationsScreen(key: state.pageKey);
}

class EpisodesRoute extends GoRouteData {
  @override
  Widget build(context, state) => EpisodesScreen(key: state.pageKey);
}

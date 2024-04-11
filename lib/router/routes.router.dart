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
  static const _key = ValueKey('characters-route-key');

  @override
  NoTransitionPage<void> buildPage(context, state) {
    return NoTransitionPage<void>(key: _key, child: CharactersScreen(key: state.pageKey));
  }
}

class LocationsRoute extends GoRouteData {
  static const _key = ValueKey('locations-route-key');

  @override
  NoTransitionPage<void> buildPage(context, state) {
    return NoTransitionPage<void>(key: _key, child: LocationsScreen(key: state.pageKey));
  }
}

class EpisodesRoute extends GoRouteData {
  static const _key = ValueKey('episodes-route-key');

  @override
  NoTransitionPage<void> buildPage(context, state) {
    return NoTransitionPage<void>(key: _key, child: EpisodesScreen(key: state.pageKey));
  }
}

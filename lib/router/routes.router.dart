import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meeseeks/screens/screens.dart';

part 'routes.router.g.dart';

/// The key of the router root
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@TypedShellRoute<RootShell>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/', routes: [
      TypedGoRoute<CharactersRoute>(path: 'characters'),
      TypedGoRoute<LocationsRoute>(path: 'locations'),
      TypedGoRoute<EpisodesRoute>(path: 'episodes'),
    ]),
  ],
)
class RootShell extends ShellRouteData {
  const RootShell();

  static final GlobalKey<NavigatorState> $navigatorKey = rootNavigatorKey;

  @override
  Widget builder(context, state, navigator) => LoadingScreen(key: state.pageKey, child: navigator);
}

class HomeRoute extends GoRouteData {
  @override
  Widget build(context, state) => HomeScreen(key: state.pageKey);
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

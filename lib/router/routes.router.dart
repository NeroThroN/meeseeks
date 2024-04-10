import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meeseeks/screens/home.screen.dart';
import 'package:meeseeks/screens/loading.screen.dart';

part 'routes.router.g.dart';

/// The key of the router root
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@TypedShellRoute<RootShell>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/'),
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

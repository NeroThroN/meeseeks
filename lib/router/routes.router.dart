import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meeseeks/screens/home.screen.dart';

part 'routes.router.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  @override
  Widget build(context, state) => HomeScreen(key: state.pageKey);
}

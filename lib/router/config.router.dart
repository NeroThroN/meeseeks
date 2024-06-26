import 'package:go_router/go_router.dart';
import 'package:meeseeks/router/routes.router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_strategy/url_strategy.dart';

part 'config.router.g.dart';

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  // Remove the leading # in the web url
  setPathUrlStrategy();

  // Enable the imperative navigation API based on the URL
  // Migration after go_router v8.0.0
  // https://docs.google.com/document/d/1VCuB85D5kYxPR3qYOjVmw8boAGKb7k62heFyfFHTOvw/edit
  GoRouter.optionURLReflectsImperativeAPIs = true;

  /// The router of the app
  final router = GoRouter(
    initialLocation: CharactersRoute().location,
    routes: $appRoutes,
  );

  // Dispose the router when the provider is disposed
  ref.onDispose(router.dispose);

  return router;
}

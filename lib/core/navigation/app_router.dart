part of 'navigation.dart';

final _key = GlobalKey<NavigatorState>();

class AppRouter {
  static final routerProvider = Provider<GoRouter>(
    (ref) => GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      initialLocation: splash,
      routes: [
        GoRoute(
          path: splash,
          name: splash,
          builder: (context, state) => const SplashScreen(),
        ),
      ],
    ),
  );
}

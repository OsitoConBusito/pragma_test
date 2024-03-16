part of 'router.dart';

final _key = GlobalKey<NavigatorState>();

class AppRouter {
  final routerProvider = Provider<GoRouter>(
    (ref) => GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      initialLocation: splash,
      routes: [
        GoRoute(
          path: splash,
          name: splash,
          builder: (context, state) => SplashScreen(),
        ),
      ],
    ),
  );
}

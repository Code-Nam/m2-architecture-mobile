import 'package:go_router/go_router.dart';
import 'package:tenpai/app/home_screen.dart';

/// Route paths, kept next to the routes so a rename touches one file.
abstract final class AppRoutes {
  /// Landing screen. Becomes the lesson path in milestone 1.
  static const home = '/';
}

/// The application router.
///
/// A plain top-level value for now. It becomes a provider once redirects need
/// to read auth state (milestone 4).
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

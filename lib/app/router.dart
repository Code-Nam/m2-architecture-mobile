import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/splash_screen.dart';
import 'package:tenpai/app/tile_gallery_screen.dart';
import 'package:tenpai/auth/auth_providers.dart';
import 'package:tenpai/auth/login_screen.dart';
import 'package:tenpai/auth/welcome_screen.dart';
import 'package:tenpai/learning/lesson_path_screen.dart';
import 'package:tenpai/learning/lesson_screen.dart';
import 'package:tenpai/onboarding/goal_screen.dart';
import 'package:tenpai/onboarding/level_screen.dart';
import 'package:tenpai/profile/profile_providers.dart';
import 'package:tenpai/profile/profile_screen.dart';
import 'package:tenpai/scanner/scanner_screen.dart';
import 'package:tenpai/yaku/yaku_screen.dart';

/// Route paths, kept next to the routes so a rename touches one file.
abstract final class AppRoutes {
  /// First tab and initial location: the lesson path.
  static const apprendre = '/apprendre';

  /// Yaku Dex tab (milestone 2).
  static const yakus = '/yakus';

  /// Camera tab (milestone 3).
  static const scanner = '/scanner';

  /// Progress and settings tab; hosts the debug gallery button meanwhile.
  static const profil = '/profil';

  /// Parking route while auth or profile state is unknown; never a target.
  static const splash = '/splash';

  /// Onboarding 01; the only entry for a signed-out user.
  static const welcome = '/welcome';

  /// Handoff 02; `?mode=signup` opens the Inscription segment.
  static const login = '/login';

  /// Onboarding 03, then 04 with the level in the query string.
  static const onboardingLevel = '/onboarding/level';

  /// Onboarding 04; reads `?level=` so a restart mid-onboarding loses nothing.
  static const onboardingGoal = '/onboarding/goal';

  /// Full-screen lesson, outside the tab shell. Ids travel in the path, never
  /// as `extra`, so the route survives restarts and deep links. Called with
  /// `':id'` it also yields the route pattern.
  static String lesson(String id) => '/lesson/$id';

  /// Debug gallery of tiles
  static const gallery = '/gallery';
}

/// Builds the one router of the app. Called by `routerProvider` so the
/// redirect can read auth and profile state through [ref]. Built once per
/// app run: `GoRouter` is a `ChangeNotifier`; recreating it on every state
/// change would reset the navigation stack, hence the `refreshListenable`
/// bridge instead of `ref.watch`.
GoRouter createRouter(Ref ref) {
  final refresh = _RouterRefresh(ref);
  ref.onDispose(refresh.dispose);
  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refresh,
    redirect: (_, state) => _redirect(ref, state.uri.path),
    routes: [
      GoRoute(path: AppRoutes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(
        path: AppRoutes.welcome,
        builder: (_, _) => const WelcomeScreen(),
      ),
      GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
      GoRoute(
        path: AppRoutes.onboardingLevel,
        builder: (_, _) => const LevelScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingGoal,
        builder: (_, _) => const GoalScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => _ShellScaffold(shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.apprendre,
                builder: (context, state) => const LessonPathScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.yakus,
                builder: (context, state) => const YakuScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.scanner,
                builder: (context, state) => const ScannerScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profil,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.gallery,
        builder: (context, state) => const TileGalleryScreen(),
      ),
      GoRoute(
        path: AppRoutes.lesson(':id'),
        builder: (context, state) =>
            LessonScreen(lessonId: state.pathParameters['id']!),
      ),
    ],
  );
}

/// Bridges Riverpod to go_router: any auth or profile change re-runs the
/// redirect. The `ref.listen` subscriptions die with the provider.
class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(Ref ref) {
    ref.listen(authStateProvider, (_, _) => notifyListeners());
    ref.listen(userProfileProvider, (_, _) => notifyListeners());
  }
}

/// The two screens a signed-out user may see.
const _entry = {AppRoutes.welcome, AppRoutes.login};

/// Both onboarding steps; a prefix test so a new step needs no edit here.
bool _onboarding(String path) => path.startsWith('/onboarding');

/// Redirect to [target] unless already there (go_router loops otherwise).
String? _only(String path, String target) => path == target ? null : target;

/// Pure function of auth + profile state and the requested path. Null =
/// allowed. Order matters: auth, then profile, then the gates.
String? _redirect(Ref ref, String path) {
  final auth = ref.read(authStateProvider);
  if (auth.isLoading) return _only(path, AppRoutes.splash);
  if (auth.value == null) {
    return _entry.contains(path) ? null : AppRoutes.welcome;
  }
  final profile = ref.read(userProfileProvider);
  if (profile.isLoading || profile.hasError) {
    return _only(path, AppRoutes.splash);
  }
  if (profile.value == null) {
    return _onboarding(path) ? null : AppRoutes.onboardingLevel;
  }
  final gated =
      path == AppRoutes.splash || _entry.contains(path) || _onboarding(path);
  return gated ? AppRoutes.apprendre : null;
}

/// Tab chrome around the branch navigators. `goBranch` switches the visible
/// branch without rebuilding the others, so each tab keeps its own stack and
/// scroll position; `/lesson/:id` and `/gallery` sit outside it on purpose.
/// Icons are stand-ins until the designer's set arrives.
class _ShellScaffold extends StatelessWidget {
  const _ShellScaffold(this._shell);
  final StatefulNavigationShell _shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _shell.currentIndex,
        onDestinationSelected: _shell.goBranch,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.school), label: 'Apprendre'),
          NavigationDestination(icon: Icon(Icons.menu), label: 'Yakus'),
          NavigationDestination(
            icon: Icon(Icons.photo_camera),
            label: 'Scanner',
          ),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

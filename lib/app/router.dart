import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/tile_gallery_screen.dart';
import 'package:tenpai/learning/lesson_path_screen.dart';
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

  /// Full-screen lesson, outside the tab shell. Ids travel in the path, never
  /// as `extra`, so the route survives restarts and deep links. Called with
  /// `':id'` it also yields the route pattern.
  static String lesson(String id) => '/lesson/$id';

  /// Debug gallery of tiles
  static const gallery = '/gallery';
}

/// The application router.
///
/// A plain top-level value for now. It becomes a provider once redirects need
/// to read auth state (milestone 4).
final appRouter = GoRouter(
  initialLocation: AppRoutes.apprendre,
  routes: [
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
  ],
);

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

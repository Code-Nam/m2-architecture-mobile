import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/auth/auth_providers.dart';
import 'package:tenpai/profile/profile_providers.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';

/// Where the router parks the user while auth or profile state is unknown.
/// A static tile, no spinner (design rule); the only interaction is the
/// retry when the profile load fails.
class SplashScreen extends ConsumerWidget {
  /// No parameters: state comes from providers, the exit from the redirect.
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The profile provider throws without a user, so it is only watched
    // once auth has produced one.
    final signedIn = ref.watch(authStateProvider).value != null;
    final failed = signedIn && ref.watch(userProfileProvider).hasError;

    return Scaffold(
      body: Center(
        child: failed
            ? RetryWidget(
                message: 'Impossible de charger votre profil.',
                onRetry: () => ref.invalidate(userProfileProvider),
              )
            : TileWidget(tile: Tile.parse('1z'), size: .demo),
      ),
    );
  }
}

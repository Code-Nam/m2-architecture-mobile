import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';

/// Profil tab. Placeholder until progress and settings land (milestone 4);
/// hosts the debug tile gallery button meanwhile.
class ProfileScreen extends StatelessWidget {
  /// No parameters: progress comes from providers.
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Profil'),
            if (kDebugMode)
              TextButton(
                onPressed: () => context.push(AppRoutes.gallery),
                child: const Text('Tile gallery'),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';

/// Placeholder landing screen proving that theme and router are wired.
///
/// Replaced by the lesson path screen in milestone 1; delete it then.
class HomeScreen extends StatelessWidget {
  /// Creates the placeholder screen.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Tenpai'),
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

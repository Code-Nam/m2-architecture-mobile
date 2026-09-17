import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';

/// Application shell: wires the router and, once `app/theme/` exists, the theme.
///
/// Deliberately stateless and empty of business logic. Features hang off the
/// router, not off this widget.
class TenpaiApp extends StatelessWidget {
  /// Creates the application shell.
  const TenpaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'Tenpai', routerConfig: appRouter);
  }
}

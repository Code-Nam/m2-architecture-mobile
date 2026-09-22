import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';
import 'package:tenpai/shared/theme/app_theme.dart';

/// Root widget: wires theme and router. The Riverpod scope sits above it in
/// `main.dart`, so tests can wrap this widget in their own scope.
class TenpaiApp extends StatelessWidget {
  /// No parameters on purpose: everything it needs comes from providers.
  const TenpaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      title: 'Tenpai',
      routerConfig: appRouter,
    );
  }
}

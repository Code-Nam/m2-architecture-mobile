import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';
import 'package:tenpai/app/theme/app_theme.dart';

/// The main entry point for the Tenpai application.
class TenpaiApp extends StatelessWidget {
  /// Creates the application shell.
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

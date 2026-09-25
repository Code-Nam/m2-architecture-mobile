import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/app_providers.dart';
import 'package:tenpai/settings/settings_providers.dart';
import 'package:tenpai/shared/theme/app_theme.dart';

/// Root widget: wires theme and router. The Riverpod scope sits above it in
/// `main.dart`, so tests can wrap this widget in their own scope.
class TenpaiApp extends ConsumerWidget {
  /// No parameters on purpose: everything it needs comes from providers.
  const TenpaiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    themeMode: ref.watch(themeModeProvider).value ?? .system,
    theme: lightTheme(),
    darkTheme: darkTheme(),
    title: 'Tenpai',
    routerConfig: ref.watch(routerProvider),
  );
}

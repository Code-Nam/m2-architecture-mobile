import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/theme/app_colors.dart';

/// Light theme assembled from the design tokens in [lightScheme] and [lightColors].
ThemeData lightTheme() => ThemeData(
  colorScheme: lightScheme,
  scaffoldBackgroundColor: lightScheme.surface,
  extensions: const [lightColors],
);

/// Dark theme assembled from the design tokens in [darkScheme] and [darkColors].
ThemeData darkTheme() => ThemeData(
  colorScheme: darkScheme,
  scaffoldBackgroundColor: darkScheme.surface,
  extensions: const [darkColors]
);

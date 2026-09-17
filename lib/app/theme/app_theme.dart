import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/theme/app_colors.dart';

/// Light theme assembled from the design tokens in [lightScheme] and [lightColors].
ThemeData lightTheme() => ThemeData(
  colorScheme: lightScheme,
  fontFamily: _fontFamily,
  textTheme: _textTheme,
  scaffoldBackgroundColor: lightScheme.surface,
  extensions: const [lightColors],
);

/// Dark theme assembled from the design tokens in [darkScheme] and [darkColors].
ThemeData darkTheme() => ThemeData(
  colorScheme: darkScheme,
  fontFamily: _fontFamily,
  textTheme: _textTheme,
  scaffoldBackgroundColor: darkScheme.surface,
  extensions: const [darkColors],
);

const _fontFamily = 'Outfit';

// AI-GENERATED (Claude) BEGIN — _textTheme from design/README.md typography table
// Why: Tedious data entry, no Flutter concept to learn.
const _monoFamily = 'IBM Plex Mono';

/// Design typography mapped onto Material slots. No `fontFamily` on the Outfit
/// styles (ThemeData.fontFamily fills it) and no `color` (the scheme's
/// onSurface is injected per mode), so one instance serves light and dark.
/// letterSpacing is in logical px: em × fontSize.
const _textTheme = TextTheme(
  // display 40/700, -0.01em
  displayLarge: TextStyle(fontSize: 40, fontWeight: .w700, letterSpacing: -0.4),
  // screenTitle 28/700
  headlineLarge: TextStyle(fontSize: 28, fontWeight: .w700),
  // stat numbers 24/600
  headlineSmall: TextStyle(fontSize: 24, fontWeight: .w600),
  // sectionTitle 20/600
  titleLarge: TextStyle(fontSize: 20, fontWeight: .w600),
  // cardTitle / yaku name 18/600
  titleMedium: TextStyle(fontSize: 18, fontWeight: .w600),
  // body 17/400, line-height 1.6
  bodyLarge: TextStyle(fontSize: 17, fontWeight: .w400, height: 1.6),
  // secondary 15/400
  bodyMedium: TextStyle(fontSize: 15, fontWeight: .w400),
  // small 13/400
  bodySmall: TextStyle(fontSize: 13, fontWeight: .w400),
  // mono 12/500, 0.12em; uppercase applied at the widget
  labelMedium: TextStyle(
    fontFamily: _monoFamily,
    fontSize: 12,
    fontWeight: .w500,
    letterSpacing: 1.4,
  ),
  // monoLabel 11/500, 0.12em; field labels, uppercase at the widget
  labelSmall: TextStyle(
    fontFamily: _monoFamily,
    fontSize: 11,
    fontWeight: .w500,
    letterSpacing: 1.3,
  ),
);
// AI-GENERATED (Claude) END

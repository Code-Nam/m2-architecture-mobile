// AI-GENERATED (Claude) BEGIN — _Palette consts from design/README.md
import 'package:material_ui/material_ui.dart';

/// Referenced only by the schemes and [AppColors] instances in this file.
abstract final class _Palette {
  // Light
  static const bone = Color(0xFFFAF7F0);
  static const surface = Color(0xFFFFFFFF);
  static const bamboo = Color(0xFF1E6B52);
  static const bambooDeep = Color(0xFF175A44);
  static const vermillion = Color(0xFFD64541);
  static const vermillionDeep = Color(0xFFC03B37);
  static const vermillionText = Color(0xFFB93531);
  static const ink = Color(0xFF1C1A17);
  static const inkSoft = Color(0xFF5C554A);
  static const muted = Color(0xFF8B8378);
  static const mutedStrong = Color(0xFF8A8172);
  static const disabled = Color(0xFFB5AC9F);
  static const disabledSoft = Color(0xFFC9C1B2);
  static const track = Color(0xFFEFEAE0);
  static const trackDeep = Color(0xFFE8E2D5);
  static const iconInactive = Color(0xFFD8D2C6);
  static const senseiPanel = Color(0xFFF7F2E7);
  static const successTint = Color(0xFFF2F8F4);
  static const successTintDeep = Color(0xFFDFEDE5);
  static const errorPanel = Color(0xFFF8E4E3);
  static const errorTint = Color(0xFFFCF1F0);
  static const errorTintDeep = Color(0xFFF5DFDD);
  static const errorCard = Color(0xFFFBEAE9);
  static const viewfinderBg = Color(0xFF141311);
  static const viewfinderBracket = Color(0xFF2E8B6B);

  // Same in both modes
  static const tileFaceTop = Color(0xFFFFFEFA);
  static const tileFaceBottom = Color(0xFFF4EEE1);
  static const tileBackTop = Color(0xFF237A5E);
  static const tileBackBottom = Color(0xFF174F3D);

  // Dark overrides
  static const boneDark = Color(0xFF171512);
  static const surfaceDark = Color(0xFF24211C);
  static const trackDark = Color(0xFF35312A);
  static const inkDark = Color(0xFFF2EDE3);
  static const mutedDark = Color(0xFFA89E8F);
  static const inkSoftDark = Color(0xFFC9C0B2);
  static const bambooText = Color(0xFF3FA37E);
  static const vermillionTextDark = Color(0xFFE05A56);
  static const senseiPanelDark = Color(0xFF2A2620);
  static const errorPanelDark = Color(0xFF38211F);
  // static const successTintDark = Color(0xFF1F2E27);
  static const iconInactiveDark = Color(0xFF4A453C);
}
// AI-GENERATED (Claude) END

/// Light color scheme.
const lightScheme = ColorScheme(
  brightness: .light,
  primary: _Palette.bamboo,
  onPrimary: _Palette.surface,
  secondary: _Palette.inkSoft,
  onSecondary: _Palette.surface,
  error: _Palette.vermillion,
  onError: _Palette.surface,
  surface: _Palette.bone,
  onSurface: _Palette.ink,
  surfaceContainer: _Palette.surface,
  onSurfaceVariant: _Palette.muted,
  outline: _Palette.disabled,
);

/// Dark color scheme.
const darkScheme = ColorScheme(
  brightness: .dark,
  primary: _Palette.bamboo,
  onPrimary: _Palette.surface,
  secondary: _Palette.inkSoftDark,
  onSecondary: _Palette.boneDark,
  error: _Palette.vermillion,
  onError: _Palette.surface,
  surface: _Palette.boneDark,
  onSurface: _Palette.inkDark,
  surfaceContainer: _Palette.surfaceDark,
  onSurfaceVariant: _Palette.mutedDark,
  outline: _Palette.iconInactiveDark,
);

// AI-GENERATED (Claude) BEGIN — AppColors expanded from the author's 3-field skeleton, plus light/dark instances
/// Colours the design needs that [ColorScheme] has no slot for.
///
/// Read with `Theme.of(context).extension<AppColors>()`.
final class AppColors extends ThemeExtension<AppColors> {
  /// Creates the set; both light and dark instances live in this file.
  const AppColors({
    required this.bambooDeep,
    required this.bambooText,
    required this.vermillionDeep,
    required this.vermillionText,
    required this.mutedStrong,
    required this.disabledSoft,
    required this.track,
    required this.trackDeep,
    required this.iconInactive,
    required this.senseiPanel,
    required this.successTint,
    required this.successTintDeep,
    required this.errorPanel,
    required this.errorTint,
    required this.errorTintDeep,
    required this.errorCard,
    required this.tileFaceTop,
    required this.tileFaceBottom,
    required this.tileBackTop,
    required this.tileBackBottom,
    required this.viewfinderBg,
    required this.viewfinderBracket,
    required this.tileInk,
  });

  /// Primary pressed / hover fill.
  final Color bambooDeep;

  /// Green text and links; the primary button keeps [ColorScheme.primary].
  final Color bambooText;

  /// Error CTA pressed / hover fill.
  final Color vermillionDeep;

  /// Error text and the hanko seal.
  final Color vermillionText;

  /// Locked-unit labels, search placeholder.
  final Color mutedStrong;

  /// Dimmed link, e.g. offline "Pourquoi ?".
  final Color disabledSoft;

  /// Progress track, segmented control track, locked nodes.
  final Color track;

  /// Progress-ring track, locked node gradient end, small chips.
  final Color trackDeep;

  /// Inactive tab icons, placeholder blocks.
  final Color iconInactive;

  /// Sensei panel background.
  final Color senseiPanel;

  /// Success panel and correct-tile gradient start.
  final Color successTint;

  /// Correct-tile gradient end.
  final Color successTintDeep;

  /// Error bottom sheet.
  final Color errorPanel;

  /// Incorrect-tile gradient start.
  final Color errorTint;

  /// Incorrect-tile gradient end.
  final Color errorTintDeep;

  /// Wrong option card.
  final Color errorCard;

  /// Tile face gradient start; ivory in both modes.
  final Color tileFaceTop;

  /// Tile face gradient end; ivory in both modes.
  final Color tileFaceBottom;

  /// Face-down tile gradient start.
  final Color tileBackTop;

  /// Face-down tile gradient end.
  final Color tileBackBottom;

  /// Symbol ink that stays the same in dark mode.
  final Color tileInk;

  /// Scanner full-screen background.
  final Color viewfinderBg;

  /// Scanner corner brackets.
  final Color viewfinderBracket;

  @override
  AppColors copyWith({
    Color? bambooDeep,
    Color? bambooText,
    Color? vermillionDeep,
    Color? vermillionText,
    Color? mutedStrong,
    Color? disabledSoft,
    Color? track,
    Color? trackDeep,
    Color? iconInactive,
    Color? senseiPanel,
    Color? successTint,
    Color? successTintDeep,
    Color? errorPanel,
    Color? errorTint,
    Color? errorTintDeep,
    Color? errorCard,
    Color? tileFaceTop,
    Color? tileFaceBottom,
    Color? tileBackTop,
    Color? tileBackBottom,
    Color? tileInk,
    Color? viewfinderBg,
    Color? viewfinderBracket,
  }) => AppColors(
    bambooDeep: bambooDeep ?? this.bambooDeep,
    bambooText: bambooText ?? this.bambooText,
    vermillionDeep: vermillionDeep ?? this.vermillionDeep,
    vermillionText: vermillionText ?? this.vermillionText,
    mutedStrong: mutedStrong ?? this.mutedStrong,
    disabledSoft: disabledSoft ?? this.disabledSoft,
    track: track ?? this.track,
    trackDeep: trackDeep ?? this.trackDeep,
    iconInactive: iconInactive ?? this.iconInactive,
    senseiPanel: senseiPanel ?? this.senseiPanel,
    successTint: successTint ?? this.successTint,
    successTintDeep: successTintDeep ?? this.successTintDeep,
    errorPanel: errorPanel ?? this.errorPanel,
    errorTint: errorTint ?? this.errorTint,
    errorTintDeep: errorTintDeep ?? this.errorTintDeep,
    errorCard: errorCard ?? this.errorCard,
    tileFaceTop: tileFaceTop ?? this.tileFaceTop,
    tileFaceBottom: tileFaceBottom ?? this.tileFaceBottom,
    tileBackTop: tileBackTop ?? this.tileBackTop,
    tileBackBottom: tileBackBottom ?? this.tileBackBottom,
    tileInk: tileInk ?? this.tileInk,
    viewfinderBg: viewfinderBg ?? this.viewfinderBg,
    viewfinderBracket: viewfinderBracket ?? this.viewfinderBracket,
  );

  @override
  AppColors lerp(AppColors? other, double t) => other == null
      ? this
      : AppColors(
          bambooDeep: Color.lerp(bambooDeep, other.bambooDeep, t)!,
          bambooText: Color.lerp(bambooText, other.bambooText, t)!,
          vermillionDeep: Color.lerp(vermillionDeep, other.vermillionDeep, t)!,
          vermillionText: Color.lerp(vermillionText, other.vermillionText, t)!,
          mutedStrong: Color.lerp(mutedStrong, other.mutedStrong, t)!,
          disabledSoft: Color.lerp(disabledSoft, other.disabledSoft, t)!,
          track: Color.lerp(track, other.track, t)!,
          trackDeep: Color.lerp(trackDeep, other.trackDeep, t)!,
          iconInactive: Color.lerp(iconInactive, other.iconInactive, t)!,
          senseiPanel: Color.lerp(senseiPanel, other.senseiPanel, t)!,
          successTint: Color.lerp(successTint, other.successTint, t)!,
          successTintDeep: Color.lerp(
            successTintDeep,
            other.successTintDeep,
            t,
          )!,
          errorPanel: Color.lerp(errorPanel, other.errorPanel, t)!,
          errorTint: Color.lerp(errorTint, other.errorTint, t)!,
          errorTintDeep: Color.lerp(errorTintDeep, other.errorTintDeep, t)!,
          errorCard: Color.lerp(errorCard, other.errorCard, t)!,
          tileFaceTop: Color.lerp(tileFaceTop, other.tileFaceTop, t)!,
          tileFaceBottom: Color.lerp(tileFaceBottom, other.tileFaceBottom, t)!,
          tileBackTop: Color.lerp(tileBackTop, other.tileBackTop, t)!,
          tileBackBottom: Color.lerp(tileBackBottom, other.tileBackBottom, t)!,
          tileInk: Color.lerp(tileInk, other.tileInk, t)!,
          viewfinderBg: Color.lerp(viewfinderBg, other.viewfinderBg, t)!,
          viewfinderBracket: Color.lerp(
            viewfinderBracket,
            other.viewfinderBracket,
            t,
          )!,
        );
}

/// Light instance of [AppColors] for use in the theme.
const lightColors = AppColors(
  bambooDeep: _Palette.bambooDeep,
  bambooText: _Palette.bamboo,
  vermillionDeep: _Palette.vermillionDeep,
  vermillionText: _Palette.vermillionText,
  mutedStrong: _Palette.mutedStrong,
  disabledSoft: _Palette.disabledSoft,
  track: _Palette.track,
  trackDeep: _Palette.trackDeep,
  iconInactive: _Palette.iconInactive,
  senseiPanel: _Palette.senseiPanel,
  successTint: _Palette.successTint,
  successTintDeep: _Palette.successTintDeep,
  errorPanel: _Palette.errorPanel,
  errorTint: _Palette.errorTint,
  errorTintDeep: _Palette.errorTintDeep,
  errorCard: _Palette.errorCard,
  tileFaceTop: _Palette.tileFaceTop,
  tileFaceBottom: _Palette.tileFaceBottom,
  tileBackTop: _Palette.tileBackTop,
  tileBackBottom: _Palette.tileBackBottom,
  tileInk: _Palette.ink,
  viewfinderBg: _Palette.viewfinderBg,
  viewfinderBracket: _Palette.viewfinderBracket,
);

/// Dark instance of [AppColors] for use in the theme.
const darkColors = AppColors(
  bambooDeep: _Palette.bambooDeep,
  bambooText: _Palette.bambooText,
  vermillionDeep: _Palette.vermillionDeep,
  vermillionText: _Palette.vermillionTextDark,
  mutedStrong: _Palette.mutedStrong,
  disabledSoft: _Palette.disabledSoft,
  track: _Palette.trackDark,
  trackDeep: _Palette.trackDeep,
  iconInactive: _Palette.iconInactiveDark,
  senseiPanel: _Palette.senseiPanelDark,
  successTint: _Palette.successTint,
  successTintDeep: _Palette.successTintDeep,
  errorPanel: _Palette.errorPanelDark,
  errorTint: _Palette.errorTint,
  errorTintDeep: _Palette.errorTintDeep,
  errorCard: _Palette.errorCard,
  tileFaceTop: _Palette.tileFaceTop,
  tileFaceBottom: _Palette.tileFaceBottom,
  tileBackTop: _Palette.tileBackTop,
  tileBackBottom: _Palette.tileBackBottom,
  tileInk: _Palette.ink,
  viewfinderBg: _Palette.viewfinderBg,
  viewfinderBracket: _Palette.viewfinderBracket,
);
// AI-GENERATED (Claude) END

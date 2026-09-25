/// Values injected at build time with `--dart-define`, plus the few
/// build-time constants that must live in exactly one place. Never read at
/// runtime from anywhere else, so a misconfigured build fails before any
/// request.
abstract final class AppConfig {
  /// Base URL of the yaku catalog host, trailing slash included.
  static const yakuBaseUrl = String.fromEnvironment('YAKU_BASE_URL');

  /// Fixed App Check debug token, allowed once in the console, so debug
  /// builds on any emulator pass without a per-device step. Empty = the
  /// SDK generates its own token, printed to logcat.
  static const appCheckDebugToken = String.fromEnvironment(
    'APP_CHECK_DEBUG_TOKEN',
  );

  /// Gemini model behind the Sensei and the tile identifier. A product
  /// choice, not a secret, hence a plain const. Flash-Lite: stable, free tier
  /// on Spark; `gemini-3.8-flash` answered every call with a 500 « high
  /// demand » on 2026-09-23, so it is not the default any more.
  static const senseiModel = 'gemini-3.5-flash-lite';
}

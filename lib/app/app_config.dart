/// Values injected at build time with `--dart-define`, plus the few
/// build-time constants that must live in exactly one place. Never read at
/// runtime from anywhere else, so a misconfigured build fails before any
/// request.
abstract final class AppConfig {
  /// Base URL of the yaku catalog host, trailing slash included.
  static const yakuBaseUrl = String.fromEnvironment('YAKU_BASE_URL');

  /// Gemini model behind the Sensei and the tile identifier. A product
  /// choice, not a secret, hence a plain const. Free tier on the Spark plan;
  /// fall back to `gemini-3.5-flash-lite` if the console asks for Blaze.
  static const senseiModel = 'gemini-3.5-flash-lite';
}

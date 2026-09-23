/// Values injected at build time with `--dart-define`; never read at runtime
/// from anywhere else, so a misconfigured build fails before any request.
abstract final class AppConfig {
  /// Base URL of the yaku catalog host, trailing slash included.
  static const yakuBaseUrl = String.fromEnvironment('YAKU_BASE_URL');
}

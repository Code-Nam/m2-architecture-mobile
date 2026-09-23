import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/app/app_config.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';

/// The one HTTP client. Base URL from build config. Private: only the
/// repository provider below consumes it; tests fake at the repository (or
/// `HttpClientAdapter`) level, never by swapping the client.
final _dioProvider = Provider<Dio>(
  (_) => Dio(
    BaseOptions(
      // ignore: avoid_redundant_argument_values, the analyzer has no --dart-define
      baseUrl: AppConfig.yakuBaseUrl,
      connectTimeout: AppTokens.networkTimeout,
      receiveTimeout: AppTokens.networkTimeout,
    ),
  ),
);

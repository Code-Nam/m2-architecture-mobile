import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/app/app_config.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/yaku/yaku_remote_source.dart';
import 'package:tenpai/yaku/yaku_repository.dart';
import 'package:tenpai/yaku/yaku_repository_impl.dart';

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

/// Swap point for the catalog: override with a fake in tests, with the
/// Isar-cached implementation at M4.
final yakuRepositoryProvider = Provider<YakuRepository>(
  (ref) => YakuRepositoryImpl(YakuRemoteSource(ref.watch(_dioProvider))),
);

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tenpai/app/app.dart';
import 'package:tenpai/app/app_config.dart';
import 'package:tenpai/firebase_options.dart';
import 'package:tenpai/local/isar_providers.dart';
import 'package:tenpai/scanner/scan_record.dart';
import 'package:tenpai/settings/settings_record.dart';
import 'package:tenpai/yaku/yaku_record.dart';

/// Entry point. `ProviderScope` is the Riverpod root; it lives here, not in
/// `TenpaiApp`, so tests can wrap `TenpaiApp` in a scope with overrides.
/// Firebase and Isar must be ready before the first provider reads them,
/// hence the awaits ahead of `runApp`; App Check runs the debug provider in
/// debug builds (token registered in the console) and Play Integrity in
/// release. Isar is opened here and handed to `isarProvider` through the
/// root override: the only async resource a provider cannot build itself.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (AppConfig.yakuBaseUrl.isEmpty) {
    throw StateError(
      'YAKU_BASE_URL is empty: pass --dart-define=YAKU_BASE_URL=<host>/ '
      '(README, Getting started).',
    );
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    providerAndroid: kDebugMode
        ? AndroidDebugProvider(
            debugToken: AppConfig.appCheckDebugToken.isEmpty
                ? null
                : AppConfig.appCheckDebugToken,
          )
        : const AndroidPlayIntegrityProvider(),
  );
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    SettingsRecordSchema,
    ScanRecordSchema,
    YakuRecordSchema,
  ], directory: dir.path);
  runApp(
    ProviderScope(
      overrides: [isarProvider.overrideWithValue(isar)],
      child: const TenpaiApp(),
    ),
  );
}

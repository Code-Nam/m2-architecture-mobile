import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/app.dart';
import 'package:tenpai/app/app_config.dart';
import 'package:tenpai/firebase_options.dart';

/// Entry point. `ProviderScope` is the Riverpod root; it lives here, not in
/// `TenpaiApp`, so tests can wrap `TenpaiApp` in a scope with overrides.
/// Firebase must be initialised before the first provider reads it, hence
/// the awaits ahead of `runApp`; App Check runs the debug provider in debug
/// builds (token registered in the console) and Play Integrity in release.
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
        ? const AndroidDebugProvider()
        : const AndroidPlayIntegrityProvider(),
  );
  runApp(const ProviderScope(child: TenpaiApp()));
}

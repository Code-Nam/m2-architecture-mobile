import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/app.dart';
import 'package:tenpai/app/app_config.dart';

/// Entry point. `ProviderScope` is the Riverpod root; it lives here, not in
/// `TenpaiApp`, so tests can wrap `TenpaiApp` in a scope with overrides.
void main() {
  assert(
    AppConfig.yakuBaseUrl.isNotEmpty,
    'YAKU_BASE_URL is empty: the catalog cannot load. Pass --dart-define=YAKU_BASE_URL=<host>/ (README, Getting started).',
  );
  runApp(const ProviderScope(child: TenpaiApp()));
}

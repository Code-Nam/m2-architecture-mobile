import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/app.dart';

/// Entry point. `ProviderScope` is the Riverpod root; it lives here, not in
/// `TenpaiApp`, so tests can wrap `TenpaiApp` in a scope with overrides.
void main() {
  runApp(const ProviderScope(child: TenpaiApp()));
}

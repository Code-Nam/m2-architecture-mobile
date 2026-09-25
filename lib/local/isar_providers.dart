import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

/// Opened once in `main` and injected through `ProviderScope(overrides:)`;
/// tests never override it, they fake the repositories above it.
final isarProvider = Provider<Isar>(
  (_) => throw UnimplementedError('isarProvider is overridden in main()'),
);

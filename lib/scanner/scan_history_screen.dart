import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/scanner/scan_record.dart';
import 'package:tenpai/scanner/scanner_providers.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/models/tile_labels.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';

/// « Tuiles scannées »: the Isar scan log, newest first. Not in the handoff;
/// it is what the Profil « Tuiles maîtrisées » count opens. Rebuilds on its
/// own after a scan because the history provider streams Isar's watch query.
class ScanHistoryScreen extends ConsumerWidget {
  /// Everything comes from `scanHistoryProvider`; no parameters.
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(scanHistoryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tuiles scannées')),
      body: history.hasError
          ? RetryWidget(
              message: "Impossible de charger l'historique",
              onRetry: () => ref.invalidate(scanHistoryProvider),
            )
          : switch (history.value) {
              null => const SizedBox.shrink(),
              [] => const _Empty(),
              final records => _List(records: records),
            },
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;

    return Center(
      child: Text(
        'Aucune tuile scannée',
        style: theme.textTheme.bodyMedium?.copyWith(color: colors.mutedStrong),
      ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({required this.records});
  final List<ScanRecord> records;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppTokens.sideMargin),
      itemCount: records.length,
      separatorBuilder: (_, _) => const SizedBox(height: AppTokens.space1),
      itemBuilder: (context, i) => _Row(record: records[i]),
    );
  }
}

/// One scan: small tile (a regular one would be clipped by `ListTile`'s
/// 56 px leading slot), French name, local date.
class _Row extends StatelessWidget {
  const _Row({required this.record});
  final ScanRecord record;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final tile = Tile.parse(record.code);
    return ListTile(
      leading: TileWidget(tile: tile, size: .small),
      title: Text(tileName(tile)),
      subtitle: Text(
        _date(record.scannedAt),
        style: theme.textTheme.labelMedium?.copyWith(color: colors.mutedStrong),
      ),
    );
  }
}

String _date(DateTime d) {
  String two(int n) => n.toString().padLeft(2, '0');
  final l = d.toLocal();
  return '${two(l.day)}/${two(l.month)}/${l.year}';
}

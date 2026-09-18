import 'package:material_ui/material_ui.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/tile_size.dart';
import 'package:tenpai/shared/widgets/tile_state.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';

final _sample = Tile.parse('1m');
final _red = Tile.parse('5pr');

/// Debug gallery of every [TileState] x [TileSize]
class TileGalleryScreen extends StatelessWidget {
  /// Creates the tile gallery
  const TileGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tile Gallery')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [for (final size in TileSize.values) _SizeRow(size: size)],
        ),
      ),
    );
  }
}

/// A row displaying every [TileState] for a given [TileSize]
class _SizeRow extends StatelessWidget {
  const _SizeRow({required this.size});

  final TileSize size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTokens.space2),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(size.name),
          Wrap(
            spacing: AppTokens.space2,
            runSpacing: AppTokens.space2,
            children: [
              for (final state in TileState.values)
                TileWidget(tile: _sample, state: state, size: size),
              TileWidget(tile: _red, size: size),
            ],
          ),
        ],
      ),
    );
  }
}

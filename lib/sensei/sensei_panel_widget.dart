import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/sensei/sensei_providers.dart';
import 'package:tenpai/sensei/sensei_request.dart';
import 'package:tenpai/sensei/sensei_state.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';

const _offlineCopy =
    'Hors ligne — les explications du sensei reviendront avec la connexion.';

/// The only AI surface in the app (handoff « Le Sensei »): seal, header and
/// one body per [SenseiState]. Hosted by the lesson feedback sheet and the
/// scanner result sheet; never blocks anything around it.
class SenseiPanelWidget extends ConsumerStatefulWidget {
  /// Same [request] → same provider member, so rebuilding the host keeps the
  /// answer; a different request is a fresh panel.
  const SenseiPanelWidget({
    super.key,
    required this.request,
    required this.autoStart,
  });

  /// Keys `senseiProvider`; built by the host, never by this widget.
  final SenseiRequest request;

  /// True on the scanner sheet (asks on first frame); false under the quiz,
  /// where « Pourquoi ? » asks instead.
  final bool autoStart;
  @override
  ConsumerState<SenseiPanelWidget> createState() => _SenseiPanelWidgetState();
}

class _SenseiPanelWidgetState extends ConsumerState<SenseiPanelWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.autoStart) {
      // AI-GENERATED (Claude) BEGIN — review finding 4: mounted guard
      // The frame may unmount the panel before this runs (re-entered scan,
      // popped test); `ref` on an unmounted widget throws.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ref.read(senseiProvider(widget.request).notifier).ask();
      });
      // AI-GENERATED (Claude) END
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(senseiProvider(widget.request));
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final muted = state is SenseiFailed || state is SenseiOffline;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.senseiPanel,
        borderRadius: AppTokens.radiusSubPanel,
        border: Border(
          left: BorderSide(
            color: muted ? colors.senseiSealMuted : colors.senseiRule,
            width: AppTokens.senseiRule,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTokens.space2),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,
          children: [
            _Header(muted: muted),
            if (state is! SenseiIdle) const SizedBox(height: AppTokens.space1),
            switch (state) {
              SenseiIdle() => const SizedBox.shrink(),
              SenseiLoading() => _Loading(label: _loadingLabel(widget.request)),
              SenseiStreaming(:final text) => _Streaming(text: text),
              SenseiDone(:final text) => Text(
                text,
                style: theme.textTheme.bodyMedium,
              ),
              SenseiFailed() => _Failure(
                onRetry: ref.read(senseiProvider(widget.request).notifier).ask,
              ),
              SenseiOffline() => Text(
                _offlineCopy,
                style: theme.textTheme.bodyMedium,
              ),
            },
          ],
        ),
      ),
    );
  }
}

String _loadingLabel(SenseiRequest request) => switch (request) {
  QuizMissRequest() => 'Le sensei regarde votre main',
  TileContextRequest() => 'Le sensei regarde la tuile',
};

/// Seal + « LE SENSEI »; [muted] greys the seal on failure / offline.
class _Header extends StatelessWidget {
  const _Header({required this.muted});

  final bool muted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;

    return Row(
      children: [
        _Seal(muted: muted),
        const SizedBox(width: AppTokens.space1),
        Text(
          'le sensei'.toUpperCase(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: colors.mutedStrong,
          ),
        ),
      ],
    );
  }
}

/// Square hanko with « 先 ». The glyph comes from the system CJK font, not
/// Outfit (known deviation, plan « Deviations »).
class _Seal extends StatelessWidget {
  const _Seal({required this.muted});

  final bool muted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;

    return SizedBox.square(
      dimension: AppTokens.senseiSealSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: muted ? colors.senseiSealMuted : colors.senseiSeal,
          borderRadius: AppTokens.radiusSeal,
        ),
        child: Center(
          child: Text(
            '先',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

/// Three pulsing tiles and the « regarde » label (handoff 09 / 15).
class _Loading extends StatelessWidget {
  const _Loading({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const _PulsingTiles(),
      const SizedBox(width: AppTokens.space1),
      Expanded(
        child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ),
    ],
  );
}

/// One controller, three staggered [Interval]s: tile *i* starts at *i*/6 of
/// the cycle (0, 0.2 s, 0.4 s of 1.2 s) and rises over half of it, which is
/// the handoff keyframe wave. Owns its ticker, so leaving the loading state
/// disposes it.
class _PulsingTiles extends StatefulWidget {
  const _PulsingTiles();

  @override
  State<_PulsingTiles> createState() => _PulsingTilesState();
}

class _PulsingTilesState extends State<_PulsingTiles>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: AppTokens.pulseDuration,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: .min,
    children: [
      for (var i = 0; i < 3; i++) ...[
        if (i > 0) const SizedBox(width: AppTokens.space1 / 2),
        _PulseTile(
          animation: _controller.drive(
            CurveTween(curve: Interval(i / 6, i / 6 + 0.5)),
          ),
        ),
      ],
    ],
  );
}

/// One green tile driven by a 0→1 animation: lifts by [AppTokens.pulseLift]
/// and fades 0.4→1. The box is built once (`child`), only the transform
/// rebuilds per frame.
class _PulseTile extends StatelessWidget {
  const _PulseTile({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, -AppTokens.pulseLift * animation.value),
        child: Opacity(opacity: 0.4 + 0.6 * animation.value, child: child),
      ),
      child: SizedBox(
        width: AppTokens.pulseTileWidth,
        height: AppTokens.pulseTileHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.bambooDeep,
            borderRadius: AppTokens.radiusProgress,
          ),
        ),
      ),
    );
  }
}

/// Streamed text with the block cursor inline at its end (handoff 10).
class _Streaming extends StatelessWidget {
  const _Streaming({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodyMedium,
      children: const [WidgetSpan(alignment: .middle, child: _Cursor())],
    ),
  );
}

/// Green block blinking with no fade: visible for the first half of the
/// period, hidden for the second (the handoff's `steps(1)`).
class _Cursor extends StatefulWidget {
  const _Cursor();

  @override
  State<_Cursor> createState() => _CursorState();
}

class _CursorState extends State<_Cursor> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: AppTokens.cursorBlink,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) =>
          Opacity(opacity: _controller.value < 0.5 ? 1 : 0, child: child),
      child: ColoredBox(
        color: colors.bambooDeep,
        child: const SizedBox(
          width: AppTokens.cursorWidth,
          height: AppTokens.cursorHeight,
        ),
      ),
    );
  }
}

/// Handoff 11: honest message left, discreet white pill right. The retry is
/// the notifier's `ask`, which restarts the stream from the failed state.
class _Failure extends StatelessWidget {
  const _Failure({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;

    return Row(
      children: [
        Expanded(
          child: Text(
            "L'explication n'est pas arrivée. Vous pouvez continuer sans elle.",
            style: theme.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(width: AppTokens.space1),
        TextButton(
          onPressed: onRetry,
          style: TextButton.styleFrom(
            backgroundColor: theme.colorScheme.surfaceContainer,
            foregroundColor: colors.bambooText,
            shape: const RoundedRectangleBorder(
              borderRadius: AppTokens.radiusCard,
            ),
          ),
          child: const Text('Réessayer'),
        ),
      ],
    );
  }
}

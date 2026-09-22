import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/learning/lesson_asset_source.dart';
import 'package:tenpai/learning/lesson_repository.dart';
import 'package:tenpai/learning/lesson_repository_impl.dart';
import 'package:tenpai/learning/lesson_session.dart';
import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/unit.dart';

/// Swap point for lesson content: override with a fake in tests.
final lessonRepositoryProvider = Provider<LessonRepository>(
  (_) => LessonRepositoryImpl(LessonAssetSource()),
);

/// Every unit in path order. Loaded once per app run; the repository caches.
final unitsProvider = FutureProvider<List<Unit>>(
  (ref) => ref.watch(lessonRepositoryProvider).units(),
);

/// One lesson by id, released when the lesson screen pops (auto-dispose).
final lessonProvider = FutureProvider.family<Lesson, String>(
  (ref, id) => ref.watch(lessonRepositoryProvider).lessonById(id),
  isAutoDispose: true,
);

/// Per-lesson session state, keyed by lesson id. Auto-disposed with the
/// screen, so reopening a lesson starts again at block 0.
final currentLessonProvider =
    NotifierProvider.family<LessonSessionNotifier, LessonSession, String>(
      LessonSessionNotifier.new,
      isAutoDispose: true,
    );

/// Drives one lesson's session: select an option, check it, advance.
///
/// Knows nothing about the lesson content; the screen compares
/// [LessonSession.blockIndex] with the block count to detect the end.
class LessonSessionNotifier extends Notifier<LessonSession> {
  /// The family argument. Only seeds [LessonSession.lessonId]; isolation
  /// between lessons comes from the family key itself.
  LessonSessionNotifier(this._lessonId);
  final String _lessonId;

  @override
  LessonSession build() =>
      LessonSession(lessonId: _lessonId, blockIndex: 0, isAnswered: false);

  /// Ignored once the block is answered, so the feedback shown stays tied to
  /// the option that was checked.
  void select(int option) {
    if (state.isAnswered) return;
    state = state.copyWith(selectedOption: option);
  }

  /// No-op without a selection or when already answered; the screen may
  /// still disable its button, the notifier does not rely on it.
  void check() {
    if (state.selectedOption == null) return;
    if (state.isAnswered) return;
    state = state.copyWith(isAnswered: true);
  }

  /// Fresh session for the following block: selection and answer reset.
  /// Builds a new value instead of `copyWith` because freezed cannot set a
  /// nullable field back to null through `copyWith`.
  void next() => state = LessonSession(
    lessonId: _lessonId,
    blockIndex: state.blockIndex + 1,
    isAnswered: false,
  );
}

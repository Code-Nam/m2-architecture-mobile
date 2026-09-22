import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/learning/lesson_asset_source.dart';
import 'package:tenpai/learning/lesson_repository.dart';
import 'package:tenpai/learning/lesson_repository_impl.dart';
import 'package:tenpai/learning/lesson_session.dart';
import 'package:tenpai/shared/models/lesson.dart';
import 'package:tenpai/shared/models/unit.dart';

/// A provider for the [LessonRepository]
final lessonRepositoryProvider = Provider<LessonRepository>(
  (_) => LessonRepositoryImpl(LessonAssetSource()),
);

/// A provider for the list of [Unit]s
final unitsProvider = FutureProvider<List<Unit>>(
  (ref) => ref.watch(lessonRepositoryProvider).units(),
);

/// A provider for the [Lesson] with the given [id]
final lessonProvider = FutureProvider.family<Lesson, String>(
  (ref, id) => ref.watch(lessonRepositoryProvider).lessonById(id),
  isAutoDispose: true,
);

/// A provider for the [LessonSession] of the lesson with the given [lessonId]
final currentLessonProvider =
    NotifierProvider.family<LessonSessionNotifier, LessonSession, String>(
      LessonSessionNotifier.new,
      isAutoDispose: true,
    );

/// Drives one lesson's session: selection, check, advance
class LessonSessionNotifier extends Notifier<LessonSession> {
  /// Creates a new [LessonSessionNotifier] for the lesson with the given [lessonId]
  LessonSessionNotifier(this._lessonId);
  final String _lessonId;

  @override
  LessonSession build() =>
      LessonSession(lessonId: _lessonId, blockIndex: 0, isAnswered: false);

  /// Selects the given [option] for the current block
  void select(int option) {
    if (state.isAnswered) return;
    state = state.copyWith(selectedOption: option);
  }

  /// Marks the current block as answered
  void check() {
    if (state.selectedOption == null) return;
    if (state.isAnswered) return;
    state = state.copyWith(isAnswered: true);
  }

  /// Moves to the next block
  void next() => state = LessonSession(
    lessonId: _lessonId,
    blockIndex: state.blockIndex + 1,
    isAnswered: false,
  );
}

// AI-GENERATED (Claude) BEGIN — verdict imports, grading fixes Task 1
import 'package:flutter/foundation.dart';
// AI-GENERATED (Claude) END
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/learning/lesson_asset_source.dart';
import 'package:tenpai/learning/lesson_repository.dart';
import 'package:tenpai/learning/lesson_repository_impl.dart';
import 'package:tenpai/learning/lesson_session.dart';
// AI-GENERATED (Claude) BEGIN — verdict imports, grading fixes Task 1
import 'package:tenpai/progress/progress_providers.dart';
import 'package:tenpai/sensei/sensei_request.dart';
// AI-GENERATED (Claude) END
import 'package:tenpai/shared/models/lesson.dart';
// AI-GENERATED (Claude) BEGIN — verdict imports, grading fixes Task 1
import 'package:tenpai/shared/models/lesson_block.dart';
// AI-GENERATED (Claude) END
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

/// Drives one lesson's session: select or pick, check, retry, advance.
///
/// Owns every lesson rule: the verdict, the Sensei request on a miss, and
/// when the lesson ends. Widgets only read [LessonSession] and call these
/// methods.
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

  // AI-GENERATED (Claude) BEGIN — verdict computed here, grading fixes Task 1
  /// Checks the pick against [block], the block on screen. No-op without a
  /// selection (an option, or at least one drill pick) or when already
  /// answered. Stores the verdict and, on a quiz or drill miss, the Sensei
  /// request; drill picks are sorted so one miss is one provider key.
  void check(LessonBlock block) {
    if (state.selectedOption == null && state.picked.isEmpty) return;
    if (state.isAnswered) return;
    final chosen = state.selectedOption;
    final (isCorrect, whyRequest) = switch (block) {
      ExplanationBlock() => (true, null),
      final QuizBlock q when chosen == q.correctIndex => (true, null),
      final QuizBlock q => (
        false,
        SenseiRequest.quizMiss(
          question: q.question,
          hand: q.hand,
          options: q.options,
          chosenIndex: chosen!,
        ),
      ),
      final DrillBlock d when setEquals(state.picked, d.answers.toSet()) => (
        true,
        null,
      ),
      final DrillBlock d => (
        false,
        SenseiRequest.drillMiss(
          prompt: d.prompt,
          hand: d.hand,
          picked: state.picked.toList()..sort(),
          answers: d.answers,
        ),
      ),
      final InteractiveBlock i => (chosen == i.correctIndex, null),
    };
    state = state.copyWith(
      isAnswered: true,
      isCorrect: isCorrect,
      whyRequest: whyRequest,
    );
  }

  /// « Continuer »: the next block, or on the last one the recorded
  /// completion. Returns true when the lesson is over, so the screen pops.
  /// The bound check comes first: [next] past the end would make the screen
  /// index out of range.
  Future<bool> advance(Lesson lesson) async {
    if (state.blockIndex < lesson.blocks.length - 1) {
      next();
      return false;
    }
    await ref.read(userProgressProvider.notifier).completeLesson(lesson);
    return true;
  }
  // AI-GENERATED (Claude) END

  /// Drill only: adds or removes one hand index; ignored once checked, so
  /// the tile states shown after « Vérifier » match what was checked.
  void toggle(int index) {
    if (state.isAnswered) return;
    final picked = {...state.picked};
    picked.contains(index) ? picked.remove(index) : picked.add(index);
    state = state.copyWith(picked: picked);
  }

  /// Fresh session for the following block: selection and answer reset.
  /// Builds a new value instead of `copyWith` because freezed cannot set a
  /// nullable field back to null through `copyWith`.
  void next() => state = _fresh(state.blockIndex + 1);

  /// Same block again after a miss: selection, picks and answer reset, so
  /// a lesson only moves on once each block is answered right.
  void retry() => state = _fresh(state.blockIndex);

  LessonSession _fresh(int blockIndex) => LessonSession(
    lessonId: _lessonId,
    blockIndex: blockIndex,
    isAnswered: false,
  );
}

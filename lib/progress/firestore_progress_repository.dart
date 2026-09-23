import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tenpai/progress/progress_repository.dart';
import 'package:tenpai/progress/user_progress.dart';
import 'package:tenpai/shared/models/lesson.dart';

/// Only file that knows `users/{uid}/progress/current`. Reads once, then
/// keeps its own copy: writes are fire-and-forget so a completion never
/// waits on the network (Firestore queues it, rules validate it).
class FirestoreProgressRepository implements ProgressRepository {
  /// [_uid] fixed at construction: a new user means a new repository.
  FirestoreProgressRepository(this._db, this._uid);
  final FirebaseFirestore _db;
  final String _uid;

  /// Last value handed out; [completeLesson] derives the next one from it
  /// instead of re-reading, so it works offline.
  UserProgress _current = const UserProgress(completedLessonIds: {}, xp: 0);

  DocumentReference<Map<String, dynamic>> get _doc =>
      _db.collection('users').doc(_uid).collection('progress').doc('current');

  @override
  Future<UserProgress> load() async {
    final data = (await _doc.get()).data();
    if (data == null) return _current;
    final ids = (data['completedLessonIds'] as List).cast<String>();
    return _current = UserProgress(
      completedLessonIds: ids.toSet(),
      xp: data['xp'] as int,
    );
  }

  @override
  Future<UserProgress> completeLesson(Lesson lesson) async {
    if (_current.isCompleted(lesson.id)) return _current;
    unawaited(
      _doc.set({
        'completedLessonIds': FieldValue.arrayUnion([lesson.id]),
        'xp': FieldValue.increment(lesson.xp),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)),
    );
    return _current = _current.copyWith(
      completedLessonIds: {..._current.completedLessonIds, lesson.id},
      xp: _current.xp + lesson.xp,
    );
  }
}

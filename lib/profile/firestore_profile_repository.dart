import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tenpai/profile/profile_repository.dart';
import 'package:tenpai/profile/user_profile.dart';

/// Only file that knows the `users/{uid}` document.
class FirestoreProfileRepository implements ProfileRepository {
  /// [_uid] is fixed at construction: a new user means a new repository.
  FirestoreProfileRepository(this._db, this._uid);
  final FirebaseFirestore _db;
  final String _uid;

  DocumentReference<Map<String, dynamic>> get _doc =>
      _db.collection('users').doc(_uid);

  @override
  Future<UserProfile?> load() async {
    final data = (await _doc.get()).data();
    return data == null ? null : UserProfile.fromMap(data);
  }

  /// Whole-document `set`, called once from onboarding. A second call would
  /// resend `createdAt` and the rules would refuse it: when a settings
  /// screen edits the answers, switch to a merge without `createdAt`.
  @override
  Future<void> save(UserProfile profile) =>
      _doc.set({...profile.toMap(), 'createdAt': FieldValue.serverTimestamp()});
}

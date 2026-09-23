import 'package:tenpai/profile/user_profile.dart';

/// Null = onboarding not finished; the router sends the user there.
abstract interface class ProfileRepository {
  /// Reads once; Firestore serves it from cache when offline.
  Future<UserProfile?> load();

  /// Whole document, `createdAt` set by the server on first write.
  Future<void> save(UserProfile profile);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/auth/auth_providers.dart';
import 'package:tenpai/profile/firestore_profile_repository.dart';
import 'package:tenpai/profile/profile_repository.dart';
import 'package:tenpai/profile/user_profile.dart';

/// Rebuilt on every auth change: sign-out then sign-in gives a fresh
/// repository for the new uid. Throws if read without a user; the router
/// guarantees one before any profile screen mounts.
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final user = ref.watch(authStateProvider).value;
  if (user == null) {
    throw StateError('ProfileRepository needs a signed-in user');
  }
  return FirestoreProfileRepository(FirebaseFirestore.instance, user.uid);
});

/// Null until onboarding completes; screens and the redirect watch it.
final userProfileProvider =
    AsyncNotifierProvider<UserProfileNotifier, UserProfile?>(
      UserProfileNotifier.new,
    );

/// Owns the loaded profile; [complete] is its only writer.
class UserProfileNotifier extends AsyncNotifier<UserProfile?> {
  @override
  Future<UserProfile?> build() => ref.watch(profileRepositoryProvider).load();

  /// Called once, from onboarding 04. Awaits the server ack (sign-up needs
  /// the network anyway), then sets state from the saved value rather than
  /// re-reading. The mounted check covers a sign-out during the save.
  Future<void> complete({
    required MahjongLevel level,
    required int dailyGoalMinutes,
  }) async {
    final profile = UserProfile(
      level: level,
      dailyGoalMinutes: dailyGoalMinutes,
    );
    await ref.read(profileRepositoryProvider).save(profile);
    if (!ref.mounted) return;
    state = AsyncData(profile);
  }
}

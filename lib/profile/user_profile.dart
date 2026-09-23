import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

/// Onboarding 03 answer. Wire names pinned: the rules check these strings.
enum MahjongLevel {
  /// « Jamais joué »: start from zero.
  never('never'),

  /// « J'ai vu jouer »: knows the shape of a game, not the rules.
  seen('seen'),

  /// « Je connais un peu »: the basics, not the score.
  some('some');

  const MahjongLevel(this.wireName);

  /// String stored in Firestore; the rules whitelist exactly these three.
  final String wireName;

  /// Throws on an unknown string: the rules make that impossible, so a
  /// throw here means the rules changed and this enum did not.
  static MahjongLevel fromWire(String s) =>
      values.firstWhere((v) => v.wireName == s);
}

/// What onboarding 03/04 produced. [createdAt] is null between `save` and
/// the server's answer: written as a server timestamp, never a device clock.
@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  /// [createdAt] optional so the notifier can hold the profile it just
  /// saved before Firestore echoes the timestamp back.
  const factory UserProfile({
    required MahjongLevel level,
    required int dailyGoalMinutes,
    DateTime? createdAt,
  }) = _UserProfile;

  /// From `users/{uid}`; a missing or pending `createdAt` reads as null.
  factory UserProfile.fromMap(Map<String, Object?> map) => UserProfile(
    level: MahjongLevel.fromWire(map['level']! as String),
    dailyGoalMinutes: map['dailyGoalMinutes']! as int,
    createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
  );

  /// Without `createdAt`: the repository adds the server timestamp.
  Map<String, Object?> toMap() => {
    'level': level.wireName,
    'dailyGoalMinutes': dailyGoalMinutes,
  };
}

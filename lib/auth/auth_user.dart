import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

/// Signed-in account as the app sees it; never a firebase_auth `User`, so
/// fakes and tests stay Firebase-free. [providerId]: 'password' or 'google.com'.
@freezed
abstract class AuthUser with _$AuthUser {
  /// [email] is null for providers that do not share one.
  const factory AuthUser({
    required String uid,
    String? email,
    required String providerId,
  }) = _AuthUser;
}

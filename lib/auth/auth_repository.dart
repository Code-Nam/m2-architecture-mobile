import 'package:tenpai/auth/auth_user.dart';

/// Every method throws [AuthFailure], never a Firebase type. Methods return
/// void on purpose: [authState] is the only truth, the router reacts to it.
abstract interface class AuthRepository {
  /// Null while signed out. Emits once on subscribe, then on every change;
  /// the router redirects off it.
  Stream<AuthUser?> authState();

  /// Existing account. Throws [AuthFailure.invalidCredentials] for a wrong
  /// pair or an unknown email alike.
  Future<void> signIn({required String email, required String password});

  /// Creates the account and signs in; [authState] emits the new user.
  Future<void> signUp({required String email, required String password});

  /// Native Google flow (account chooser); [AuthFailure.cancelled] when the
  /// user backs out of it.
  Future<void> signInWithGoogle();

  /// Sends the reset email. Firebase does not reveal whether the address
  /// exists, so the UI says « envoyé » either way.
  Future<void> sendPasswordReset(String email);

  /// [authState] emits null; providers keyed on the uid rebuild from it.
  Future<void> signOut();
}

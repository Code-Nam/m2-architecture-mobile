import 'package:firebase_auth/firebase_auth.dart';
import 'package:tenpai/auth/auth_failure.dart';
import 'package:tenpai/auth/auth_repository.dart';
import 'package:tenpai/auth/auth_user.dart';

/// The only file that knows firebase_auth. Maps its exceptions to
/// [AuthFailure] and its `User` to [AuthUser] at the boundary, so nothing
/// above this line imports Firebase.
class FirebaseAuthRepository implements AuthRepository {
  /// Injected, never `FirebaseAuth.instance` here, so a test can hand in
  /// nothing and still construct the class.
  FirebaseAuthRepository(this._auth);
  final FirebaseAuth _auth;

  /// Every Firebase call goes through here so the mapping lives once.
  Future<T> _guard<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromCode(e.code);
    }
  }

  @override
  Stream<AuthUser?> authState() => _auth.authStateChanges().map(_toUser);

  @override
  Future<void> signIn({required String email, required String password}) =>
      _guard(
        () =>
            _auth.signInWithEmailAndPassword(email: email, password: password),
      );

  @override
  Future<void> signUp({required String email, required String password}) =>
      _guard(
        () => _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );

  @override
  Future<void> signInWithGoogle() =>
      _guard(() => _auth.signInWithProvider(GoogleAuthProvider()));

  @override
  Future<void> sendPasswordReset(String email) =>
      _guard(() => _auth.sendPasswordResetEmail(email: email));

  @override
  Future<void> signOut() => _guard(_auth.signOut);

  AuthUser? _toUser(User? user) => user == null
      ? null
      : AuthUser(
          uid: user.uid,
          email: user.email,
          providerId: user.providerData.firstOrNull?.providerId ?? 'password',
        );
}

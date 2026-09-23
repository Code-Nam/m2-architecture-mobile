/// What the login screen can say about a failed call. An enum, not the
/// Firebase exception, so screens and tests never depend on firebase_auth
/// and every value has exactly one French line.
enum AuthFailure implements Exception {
  /// Wrong email/password pair, or no such account: Firebase deliberately
  /// does not distinguish them, neither do we.
  invalidCredentials,

  /// Sign-up with an email that already has an account.
  emailInUse,

  /// Firebase's minimum is six characters.
  weakPassword,

  /// Malformed address; caught server-side, no local regex.
  invalidEmail,

  /// No connectivity; the user can simply retry.
  network,

  /// The Google account chooser was dismissed. Not an error to shout about.
  cancelled,

  /// Any code not mapped in [fromCode]; the message stays generic.
  unknown;

  /// French line shown under the form.
  String get message => switch (this) {
    .invalidCredentials => 'Email ou mot de passe incorrect.',
    .emailInUse => 'Cet email est déjà utilisé.',
    .weakPassword => 'Le mot de passe est trop faible.',
    .invalidEmail => 'L\'email n\'est pas valide.',
    .network => 'Erreur réseau, veuillez réessayer.',
    .cancelled => 'Opération annulée.',
    .unknown => 'Une erreur inconnue est survenue.',
  };

  /// Codes from `FirebaseAuthException.code`; anything unmapped is [unknown].
  static AuthFailure fromCode(String code) => switch (code) {
    'invalid-credential' ||
    'wrong-password' ||
    'user-not-found' => .invalidCredentials,
    'email-already-in-use' => .emailInUse,
    'weak-password' => .weakPassword,
    'invalid-email' => .invalidEmail,
    'network-request-failed' => .network,
    'web-context-canceled' || 'canceled' => .cancelled,
    _ => .unknown,
  };
}

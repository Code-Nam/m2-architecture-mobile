import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenpai/auth/auth_repository.dart';
import 'package:tenpai/auth/auth_user.dart';
import 'package:tenpai/auth/firebase_auth_repository.dart';

/// Only place that touches FirebaseAuth.instance; tests override this.
final authRepositoryProvider = Provider<AuthRepository>(
  (_) => FirebaseAuthRepository(FirebaseAuth.instance),
);

/// null = signed out; loading until the first event. The router watches it.
final authStateProvider = StreamProvider<AuthUser?>(
  (ref) => ref.watch(authRepositoryProvider).authState(),
);

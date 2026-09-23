import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tenpai/app/router.dart';

/// The router, kept alive for the whole run. Tests override it with a
/// `GoRouter` built from their own routes.
final routerProvider = Provider<GoRouter>(createRouter);

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/app/router.dart';
import 'package:tenpai/auth/auth_providers.dart';
import 'package:tenpai/profile/profile_providers.dart';
import 'package:tenpai/profile/user_profile.dart';
import 'package:tenpai/progress/progress_providers.dart';
import 'package:tenpai/scanner/scanner_providers.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/primary_button_widget.dart';
import 'package:tenpai/shared/widgets/retry_widget.dart';

/// Profil tab, handoff 18 reduced to account, onboarding answers, XP,
/// lessons, « Tuiles maîtrisées » (distinct scanned tiles, from Isar; opens
/// the scan history) and sign-out; streak, activity graph and badges come
/// later. Sign-out never navigates: the auth stream goes null and the
/// router does the rest.
class ProfileScreen extends ConsumerWidget {
  /// No parameters: everything comes from providers.
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    final profile = ref.watch(userProfileProvider);
    final progress = ref.watch(userProgressProvider);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppTokens.sideMargin),
          children: [
            _AccountHeader(
              email: user?.email,
              google: user?.providerId == 'google.com',
            ),
            const SizedBox(height: AppTokens.space3),
            if (progress.hasError)
              RetryWidget(
                message: 'Impossible de charger votre progression.',
                onRetry: () => ref.invalidate(userProgressProvider),
              )
            else ...[
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: 'XP',
                      value: '${progress.value?.xp ?? 0}',
                    ),
                  ),
                  const SizedBox(width: AppTokens.space2),
                  Expanded(
                    child: _StatCard(
                      label: 'Leçons',
                      value:
                          '${progress.value?.completedLessonIds.length ?? 0}',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTokens.space2),
              _StatCard(
                label: 'Tuiles maîtrisées',
                value: '${ref.watch(masteredTilesProvider)}',
                onTap: () => context.push(AppRoutes.scanHistory),
              ),
            ],
            const SizedBox(height: AppTokens.space3),
            if (profile.value case final p?) _ProfileCard(profile: p),
            const SizedBox(height: AppTokens.space4),
            PrimaryButtonWidget(
              label: 'Se déconnecter',
              color: Theme.of(context).colorScheme.error,
              onPressed: () => ref.read(authRepositoryProvider).signOut(),
            ),
            if (kDebugMode)
              TextButton(
                onPressed: () => context.push(AppRoutes.gallery),
                child: const Text('Tile gallery'),
              ),
          ],
        ),
      ),
    );
  }
}

/// Avatar letter + email; « Compte Google » when the provider has no email.
class _AccountHeader extends StatelessWidget {
  const _AccountHeader({required this.email, required this.google});
  final String? email;
  final bool google;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final name = email ?? 'Compte Google';
    return Row(
      children: [
        CircleAvatar(
          radius: AppTokens.logoCardSize / 2,
          backgroundColor: colors.track,
          child: Text(
            name[0].toUpperCase(),
            style: theme.textTheme.headlineLarge,
          ),
        ),
        const SizedBox(width: AppTokens.space2),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(name, style: theme.textTheme.titleMedium),
              Text(
                (google ? 'compte google' : 'email').toUpperCase(),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colors.mutedStrong,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// One number with its mono caption (handoff 18 stat block).
class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value, this.onTap});
  final String label;
  final String value;

  /// Null keeps the card inert (no ripple). Ink paints on the nearest
  /// `Material`; without the transparent one inside, that would be the
  /// page's, which the opaque `DecoratedBox` covers.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: AppTokens.radiusCard,
        boxShadow: AppTokens.shadowSurface,
      ),
      child: Material(
        type: .transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppTokens.radiusCard,
          child: Padding(
            padding: const EdgeInsets.all(AppTokens.space2),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(value, style: theme.textTheme.headlineLarge),
                Text(
                  label.toUpperCase(),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colors.mutedStrong,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The two onboarding answers, read-only for now.
class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.profile});
  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget row(String label, String value) => Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium),
        Text(value, style: theme.textTheme.titleMedium),
      ],
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: AppTokens.radiusCard,
        boxShadow: AppTokens.shadowSurface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTokens.space2),
        child: Column(
          children: [
            row('Niveau', _levelLabel(profile.level)),
            const SizedBox(height: AppTokens.space1),
            row('Objectif', '${profile.dailyGoalMinutes} min / jour'),
          ],
        ),
      ),
    );
  }
}

/// French label of an onboarding answer, same words as screen 03.
String _levelLabel(MahjongLevel level) => switch (level) {
  .never => 'Jamais joué',
  .seen => "J'ai vu jouer",
  .some => 'Je connais un peu',
};

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tenpai/auth/auth_failure.dart';
import 'package:tenpai/auth/auth_providers.dart';
import 'package:tenpai/shared/models/tile.dart';
import 'package:tenpai/shared/theme/app_colors.dart';
import 'package:tenpai/shared/theme/app_tokens.dart';
import 'package:tenpai/shared/widgets/primary_button_widget.dart';
import 'package:tenpai/shared/widgets/tile_widget.dart';

/// Handoff 02, Connexion | Inscription. Never navigates: the router reacts
/// to [authStateProvider] once a call succeeds.
class LoginScreen extends ConsumerStatefulWidget {
  /// [signUp] opens the Inscription segment (« Commencer » on welcome).
  const LoginScreen({super.key, required this.signUp});

  /// Initial segment only; the user can switch afterwards.
  final bool signUp;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late bool _signUp = widget.signUp;
  bool _obscure = true;
  bool _busy = false;
  AuthFailure? _failure;
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppTokens.sideMargin),
          children: [
            const SizedBox(height: AppTokens.space4),
            const Center(child: _LogoCard()),
            const SizedBox(height: AppTokens.space2),
            Center(child: Text('Tenpai', style: theme.textTheme.headlineLarge)),
            const SizedBox(height: AppTokens.space3),
            _Segmented(
              signUp: _signUp,
              onChanged: (v) => setState(() {
                _signUp = v;
                _failure = null;
              }),
            ),
            const SizedBox(height: AppTokens.space2),
            // AI-GENERATED (Claude) BEGIN — email + password fields, reset link
            _field(controller: _email, label: 'EMAIL'),
            const SizedBox(height: AppTokens.space2),
            _field(
              controller: _password,
              label: 'MOT DE PASSE',
              obscure: _obscure,
              action: .done,
              onSubmitted: (_) => _submit(),
              suffix: TextButton(
                onPressed: () => setState(() => _obscure = !_obscure),
                child: Text(_obscure ? 'Afficher' : 'Masquer'),
              ),
            ),
            Align(
              alignment: .centerRight,
              child: TextButton(
                onPressed: _busy ? null : _reset,
                child: const Text('Mot de passe oublié ?'),
              ),
            ),
            // AI-GENERATED (Claude) END
            PrimaryButtonWidget(
              label: _signUp ? 'Créer un compte' : 'Se connecter',
              onPressed: _busy ? null : _submit,
            ),
            if (_failure case final f?) _ErrorLine(f.message),
            // AI-GENERATED (Claude) BEGIN — « ou », Google, Apple, legal line
            const _OrDivider(),
            _ProviderButton.google(onPressed: _busy ? null : _google),
            const SizedBox(height: AppTokens.space1),
            const _ProviderButton.apple(),
            const SizedBox(height: AppTokens.space3),
            const _LegalLine(),
            // AI-GENERATED (Claude) END
          ],
        ),
      ),
    );
  }

  // AI-GENERATED (Claude) BEGIN — field builder and auth actions
  /// One shape for both fields; the theme supplies the card, this adds the
  /// mono uppercase label of the handoff.
  Widget _field({
    required TextEditingController controller,
    required String label,
    bool obscure = false,
    TextInputAction action = .next,
    Widget? suffix,
    ValueChanged<String>? onSubmitted,
  }) => TextField(
    controller: controller,
    obscureText: obscure,
    autocorrect: false,
    enableSuggestions: !obscure,
    textInputAction: action,
    onSubmitted: onSubmitted,
    keyboardType: obscure ? .visiblePassword : .emailAddress,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: Theme.of(context).textTheme.labelSmall,
      suffix: suffix,
    ),
  );

  /// Every auth call goes through here: one busy flag, one error line. A
  /// cancelled Google chooser is not an error worth a message.
  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _failure = null;
    });
    try {
      await action();
    } on AuthFailure catch (failure) {
      if (failure != AuthFailure.cancelled) {
        setState(() => _failure = failure);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _submit() {
    final repository = ref.read(authRepositoryProvider);
    final email = _email.text.trim();
    final password = _password.text;
    return _run(
      () => _signUp
          ? repository.signUp(email: email, password: password)
          : repository.signIn(email: email, password: password),
    );
  }

  Future<void> _google() =>
      _run(ref.read(authRepositoryProvider).signInWithGoogle);

  /// Needs an email in the field; Firebase says « envoyé » whether or not
  /// the address exists, so the UI does too.
  Future<void> _reset() async {
    final email = _email.text.trim();
    if (email.isEmpty) {
      setState(() => _failure = AuthFailure.invalidEmail);
      return;
    }
    await _run(() => ref.read(authRepositoryProvider).sendPasswordReset(email));
    if (mounted && _failure == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Email envoyé.')));
    }
  }
  // AI-GENERATED (Claude) END
}

class _LogoCard extends StatelessWidget {
  const _LogoCard();
  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: AppTokens.logoCardSize,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: AppTokens.radiusCard,
        boxShadow: AppTokens.shadowSurface,
      ),
      child: Center(
        child: TileWidget(tile: Tile.parse('1z'), size: .small),
      ),
    ),
  );
}

/// Connexion | Inscription (handoff 02). A white pill slides under fixed
/// labels; a `Stack` rather than two buttons so only the pill animates.
class _Segmented extends StatelessWidget {
  const _Segmented({required this.signUp, required this.onChanged});
  final bool signUp;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return SizedBox(
      height: AppTokens.segmentHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.track,
          borderRadius: AppTokens.radiusCard,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTokens.space1 / 2),
          child: Stack(children: [_pill(theme), _labels(theme, colors)]),
        ),
      ),
    );
  }

  Widget _pill(ThemeData theme) => AnimatedAlign(
    alignment: signUp ? .centerRight : .centerLeft,
    duration: AppTokens.duration,
    curve: AppTokens.curve,
    child: FractionallySizedBox(
      widthFactor: 0.5,
      heightFactor: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: AppTokens.radiusSubPanel,
          boxShadow: AppTokens.shadowSurface,
        ),
      ),
    ),
  );

  Widget _labels(ThemeData theme, AppColors colors) => Row(
    children: [
      _half(
        'Connexion',
        selected: !signUp,
        onTap: () => onChanged(false),
        theme,
        colors,
      ),
      _half(
        'Inscription',
        selected: signUp,
        onTap: () => onChanged(true),
        theme,
        colors,
      ),
    ],
  );

  Widget _half(
    String label,
    ThemeData theme,
    AppColors colors, {
    required bool selected,
    required VoidCallback onTap,
  }) => Expanded(
    child: InkWell(
      borderRadius: AppTokens.radiusSubPanel,
      onTap: onTap,
      child: Center(
        child: Text(
          label,
          style: theme.textTheme.titleMedium?.copyWith(
            color: selected ? theme.colorScheme.onSurface : colors.mutedStrong,
          ),
        ),
      ),
    ),
  );
}

/// « ou » between the email form and the providers, mono caps like every
/// small label of the handoff.
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTokens.space3),
      child: Row(
        children: [
          Expanded(child: Divider(color: colors.trackDeep)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTokens.space2),
            child: Text(
              'ou'.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: colors.mutedStrong,
              ),
            ),
          ),
          Expanded(child: Divider(color: colors.trackDeep)),
        ],
      ),
    );
  }
}

/// Full-width OAuth button. Google is a white card with a « G » badge; Apple
/// is the charcoal one, disabled for now (Android only, no developer
/// account), which the theme greys out.
class _ProviderButton extends StatelessWidget {
  const _ProviderButton.google({required this.onPressed})
    : _label = 'Continuer avec Google',
      _badge = 'G',
      _dark = false;

  const _ProviderButton.apple()
    : onPressed = null,
      _label = 'Continuer avec Apple',
      _badge = '',
      _dark = true;

  /// Null renders disabled.
  final VoidCallback? onPressed;
  final String _label;
  final String _badge;
  final bool _dark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final colors = theme.extension<AppColors>()!;
    return FilledButton.icon(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: _dark ? scheme.onSurface : scheme.surfaceContainer,
        foregroundColor: _dark ? scheme.surface : scheme.onSurface,
        disabledBackgroundColor: colors.iconInactive,
        disabledForegroundColor: colors.mutedStrong,
        minimumSize: const Size.fromHeight(AppTokens.buttonHeight),
        shape: const RoundedRectangleBorder(borderRadius: AppTokens.radiusCard),
      ),
      icon: CircleAvatar(
        radius: AppTokens.badgeSize / 2,
        backgroundColor: _dark ? colors.mutedStrong : colors.track,
        child: Text(
          _badge,
          style: theme.textTheme.labelMedium?.copyWith(color: scheme.onSurface),
        ),
      ),
      label: Text(_label),
    );
  }
}

/// Handoff 02 footer. The two links have no page behind them yet, so they
/// are underlined text only.
class _LegalLine extends StatelessWidget {
  const _LegalLine();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColors>()!;
    final base = theme.textTheme.bodySmall?.copyWith(color: colors.mutedStrong);
    final link = base?.copyWith(decoration: TextDecoration.underline);
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          const TextSpan(text: 'En continuant, vous acceptez les '),
          TextSpan(text: "conditions d'utilisation", style: link),
          const TextSpan(text: ' et la '),
          TextSpan(text: 'politique de confidentialité', style: link),
          const TextSpan(text: '.'),
        ],
      ),
      textAlign: .center,
    );
  }
}

class _ErrorLine extends StatelessWidget {
  const _ErrorLine(this.message);
  final String message;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: AppTokens.space1),
    child: Text(
      message,
      style: Theme.of(context).textTheme.bodySmall
          ?.copyWith(color: Theme.of(context).colorScheme.error),
      textAlign: .center,
    ),
  );
}

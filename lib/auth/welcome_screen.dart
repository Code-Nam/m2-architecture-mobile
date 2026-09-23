import 'package:material_ui/material_ui.dart';

/// Onboarding 01. Placeholder until Task 7.
class WelcomeScreen extends StatelessWidget {
  /// No parameters: navigation comes from the router.
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Bienvenue')));
}

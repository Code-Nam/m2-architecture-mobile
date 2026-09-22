import 'package:material_ui/material_ui.dart';

/// Apprendre tab: the unit and lesson path. Placeholder until Task 7 fills
/// it in place; the route already points here.
class LessonPathScreen extends StatelessWidget {
  /// No parameters: units and progress come from providers.
  const LessonPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Apprendre')));
  }
}

import 'package:material_ui/material_ui.dart';

/// Yakus tab. Placeholder until the Yaku Dex lands (milestone 2).
class YakuScreen extends StatelessWidget {
  /// No parameters; the catalog will come from a provider over the REST API.
  const YakuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Yakus')));
  }
}

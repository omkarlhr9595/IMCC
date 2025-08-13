import 'package:flutter/material.dart';
import 'injection_container.dart';
import 'features/trending_movies/presentation/pages/trending_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TrendingPage());
  }
}

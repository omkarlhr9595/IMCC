import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'features/trending_movies/presentation/bloc/trending_bloc.dart';
import 'features/trending_movies/presentation/screens/trending_screen.dart';
import 'injection_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<TrendingBloc>(create: (_) => TrendingBloc(sl())..add(const TrendingRequestedEvent())),
      ],
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) {
          ColorScheme lightScheme;
          ColorScheme darkScheme;

          if (lightDynamic != null && darkDynamic != null) {
            lightScheme = lightDynamic.harmonized();
            darkScheme = darkDynamic.harmonized();
          } else {
            const fallbackSeed = Color(0xFF6750A4);
            lightScheme = ColorScheme.fromSeed(
              seedColor: fallbackSeed,
              brightness: Brightness.light,
            );
            darkScheme = ColorScheme.fromSeed(
              seedColor: fallbackSeed,
              brightness: Brightness.dark,
            );
          }

          return MaterialApp(
            theme: ThemeData(
              colorScheme: lightScheme,
              useMaterial3: true,
              textTheme: GoogleFonts.interTextTheme(),
            ),
            darkTheme: ThemeData(
              colorScheme: darkScheme,
              useMaterial3: true,
              textTheme: GoogleFonts.interTextTheme(),
            ),
            themeMode: ThemeMode.system,
            home: const TrendingScreen(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:penuba/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.indigo,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          shadowColor: Theme.of(context).shadowColor,
          scrolledUnderElevation: 2,
        ),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.transparent,
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.initial,
      onGenerateRoute: AppRoute.onGenerate,
    );
  }
}

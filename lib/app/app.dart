import 'package:flutter/material.dart';

import 'feature/home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo com Providers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
      },
    );
  }
}

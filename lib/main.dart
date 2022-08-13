import 'package:flutter/material.dart';

import 'src/pages/login.dart';
import 'src/pages/registro.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rompe Filas 1.0',
      initialRoute: 'home',
      routes: {'home': (_) => const RegistroScreen()},
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}

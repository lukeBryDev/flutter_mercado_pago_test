import 'package:flutter/material.dart';
import 'package:mercado_pago_example/src/features/app/presentation/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Mercado Pago Pay Demo'),
    );
  }
}
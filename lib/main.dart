import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mercado_pago_example/src/core/env/env.dart';
import 'package:mercado_pago_example/src/features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "./environments/.env.main");

  Env(EnvMode.sandbox);
  runApp(const App());
}

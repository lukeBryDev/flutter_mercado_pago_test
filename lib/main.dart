import 'package:flutter/material.dart';
import 'package:mercado_pago_example/src/core/env/env.dart';
import 'package:mercado_pago_example/src/features/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Env(EnvMode.sandbox, const EnvOptions(stageNumberSandbox: 2));
  runApp(const App());
}

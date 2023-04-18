import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mercado_pago_example/src/core/env/env.dart';
import 'package:mercado_pago_example/src/core/settings/app_assets.dart';
import 'package:mercado_pago_example/src/features/data/models/mp_preference_model.dart';
import 'package:mercado_pago_example/src/features/domain/entities/mp_preference_entity.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _counter = 0;
  bool _loading = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<MPPreferenceEntity> getPreference() async {
    var mp = MP(Env.mpClientId, Env.mpClientSecret);
    var preference = {
      "items": [
        {
          "title": "Test",
          "quantity": 1,
          "currency_id": "USD",
          "unit_price": _counter
        }
      ]
    };
    setState(() => _loading = true);
    var result = await mp.createPreference(preference);
    setState(() => _loading = false);

    return MPPreferenceModel.fromJson(result["response"]);
  }

  void _pay() async {
    getPreference().then((res) {
      log('$res', name: 'resut');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have to pay:',
            ),
            Text(
              '\$$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            MaterialButton(
              onPressed: _loading ? null : () => _pay(),
              height: 44,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 3),
              color: const Color(0xff00B1EA),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.mercadoPagoLogo,
                    height: 30,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(width: 8.6),
                  const Text(
                    'Pagar con Mercado Pago',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

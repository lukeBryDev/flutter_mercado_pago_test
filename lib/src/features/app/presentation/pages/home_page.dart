import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mercado_pago_example/src/core/env/env.dart';
import 'package:mercado_pago_example/src/core/settings/app_assets.dart';
import 'package:mercado_pago_example/src/features/data/dtos/address_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/excluded_payment_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/identification_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_method_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_payer_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_payment_methods_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_preference_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/mp_preference_item_dto.dart';
import 'package:mercado_pago_example/src/features/data/dtos/phone_dto.dart';
import 'package:mercado_pago_example/src/features/data/models/mp_preference_model.dart';
import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_identification_type.dart';
import 'package:mercado_pago_example/src/features/domain/entities/enums/enum_mp_currence_id_type.dart';
import 'package:mercado_pago_example/src/features/domain/entities/mp_preference_entity.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    const mercadoPagoResponseChannel =
        MethodChannel("developergbp.com/mercadoPago/response");
    mercadoPagoResponseChannel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case "mercadoPagoOK":
          var id = call.arguments[0];
          var status = call.arguments[1];
          var statusDetail = call.arguments[2];
          return _mercadoPagoOK(id, status, statusDetail);
        case "paymentError":
          var error = call.arguments[0];
          return _mercadoPagoError(error);
        case "paymentCancelled":
          break;
      }
    });
    super.initState();
  }

  double _counter = 0;
  bool _loading = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _mercadoPagoOK(id, status, statusDetail) {
    log('$id', name: 'id');
    log('$status', name: 'status');
    log('$statusDetail', name: 'statusDetail');
  }

  void _mercadoPagoError(error) {
    log('$error', name: 'error');
  }

  Future<MPPreferenceEntity?> getPreference() async {
    try {
      var mp = MP(Env.mpClientId, Env.mpClientSecret);
      var preferenceDTO = MPPreferenceDTO(
        items: [
          MPPreferenceItemDTO(
            title: "Test",
            quantity: 1,
            currencyId: MPCurrencyIdType.usd,
            unitPrice: _counter,
            payer: MPPayerDTO(
              name: 'Developer',
              surname: 'GBP',
              email: 'developergbp@gbp.com',
              address: AddressDTO(
                streetName: ' 123 Sesame Street',
                streetNumber: 44,
                zipCode: "10023",
              ),
              dateCreated: DateTime.now(),
              identification: IdentificationDTO(
                  type: IdentificationType.cc, number: "1234567890"),
              phone: PhoneDTO(areaCode: 57, number: 3161984006),
            ),
            paymentMethods: MPPaymentMethodsDTO(
              excludedPaymentTypes: [
                ExcludedPaymentDTO(id: "ticket"),
                ExcludedPaymentDTO(id: "atm"),
              ],
            ),
          ),
        ],
      );
      setState(() => _loading = true);

      log('${preferenceDTO.toJson()}', name: 'params');
      var result = await mp.createPreference(preferenceDTO.toJson());
      setState(() => _loading = false);
      return MPPreferenceModel.fromJson(result['response']);
    } catch (e) {
      log('$e', name: 'error');
      return null;
    }
  }

  Future<void> _pay() async {
    getPreference().then((result) {
      log('$result', name: 'resut');
      if (result == null) return;

      try {
        var params = MPMethodDTO(
          preferenceId: result.id,
          publicKey: Env.mpPublicKey,
        );
        const mercadoPagoChannel =
            MethodChannel("developergbp.com/mercadoPago");
        log('${params.toJson()}', name: 'params to method');
        final response =
            mercadoPagoChannel.invokeListMethod("mercadoPago", params.toJson());

        log('$response', name: 'response');
      } on PlatformException catch (e) {
        log('${e.message}', name: 'PlatformException');
      }
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
            IgnorePointer(
              ignoring: _loading || _counter == 0,
              child: Opacity(
                opacity: (_loading || _counter == 0) ? 0.5 : 1,
                child: MaterialButton(
                  onPressed: () => _pay(),
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
                ),
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

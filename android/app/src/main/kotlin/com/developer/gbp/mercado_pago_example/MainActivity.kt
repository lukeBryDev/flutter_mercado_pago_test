package com.developer.gbp.mercado_pago_example


import android.app.Activity
import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.mercadopago.android.px.core.MercadoPagoCheckout
import com.mercadopago.android.px.model.Payment


class MainActivity : FlutterActivity() {
    private val CHANNELMP = "developergbp.com/mercadoPago"
    private val CHANNELMPRES = "developergbp.com/mercadoPago/response"
    private val REQUEST_CODE = 1

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        initFlutterChannels()
        super.configureFlutterEngine(flutterEngine)
    }

    private fun initFlutterChannels() {
        val channelMercadoPago = flutterEngine?.dartExecutor?.let {
            MethodChannel(
                it.binaryMessenger,
                CHANNELMP
            )
        }
        channelMercadoPago?.setMethodCallHandler { call, result ->
            // This method is invoked on the main thread.
            val args = call.arguments as HashMap<String, Any>;
            val publicKey = args["publicKey"] as String;
            val preferenceId = args["preferenceId"] as String;

            when (call.method) {
                "mercadoPago" -> mercadoPago(publicKey, preferenceId, result)
                else -> return@setMethodCallHandler
            }
        }
    }

    private fun mercadoPago(
        publicKey: String,
        preferenceId: String,
        channelResult: MethodChannel.Result
    ) {
        MercadoPagoCheckout.Builder(publicKey, preferenceId).build()
            .startPayment(this@MainActivity, REQUEST_CODE);

    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        val channelMercadoPagoResponse = flutterEngine?.dartExecutor?.let {
            MethodChannel(
                it.binaryMessenger,
                CHANNELMPRES
            )
        }

        if (resultCode == MercadoPagoCheckout.PAYMENT_RESULT_CODE) {
            val payment =
                data!!.getSerializableExtra(MercadoPagoCheckout.EXTRA_PAYMENT_RESULT) as Payment
            val paymentStatus = payment.paymentStatus
            val paymentStatusDetail = payment.paymentStatusDetail
            val paymentId = payment.id

            val mapRes = mapOf<String, Any>(
                "message" to "successful payment",
                "paymentId" to paymentId.toString(),
                "paymentStatus" to paymentStatus,
                "paymentStatusDetail" to paymentStatusDetail
            )
            val arrayList = ArrayList<String>()

            arrayList.add(paymentId.toString())
            arrayList.add(paymentStatus)
            arrayList.add(paymentStatusDetail)
            channelMercadoPagoResponse?.invokeMethod("mercadoPagoOK", mapRes)
        } else if (resultCode == Activity.RESULT_CANCELED) {
            val arrayList = ArrayList<kotlin.String>()
            arrayList.add("paymentError")
            val mapRes = mapOf<String, Any>(
                "message" to "paymentError",
            )
            channelMercadoPagoResponse?.invokeMethod("mercadoPagoError", mapRes)
        } else {
            val mapRes = mapOf<String, Any>(
                "message" to "paymentCancelled",
            )
            val arrayList = ArrayList<kotlin.String>()
            arrayList.add("paymentCancelled")
            channelMercadoPagoResponse?.invokeMethod("mercadoPagoCancelled", mapRes)
        }
    }
}


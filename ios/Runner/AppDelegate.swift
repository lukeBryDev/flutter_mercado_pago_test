import UIKit
import Flutter
import MercadoPagoSDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, PXLifeCycleProtocol  {
    var flutterVC :FlutterViewController!
    var navigationController : UINavigationController?
    var channelMErcadoPago : FlutterMethodChannel!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      flutterVC = window?.rootViewController as? FlutterViewController
        = UINavigationController(rootViewController: flutterVC)
      window?.rootViewController = navigationController
      navigationController?.navigationBar.isHidden = true
      channelMErcadoPago = FlutterMethodChannel(name: "developergbp.com/mercadoPago")
       initMethodChannel()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func initMethodChannel() {
        channelMErcadoPago.setMethodCallHandler { [unowned self] (methodCall, result) in
            if let args = methodCall as? Dictionary<String, Any>,
            let publicKey = args["publicKey"] as? String,
            let referenceId = args["preferenceId"] as? String {
                self.mercadoPago(publicKey: publicKey, preferenceId: preferenceId, result: result)
            }
             
        }
    }
    private func  mercadoPago(publicKey: String, preferenceId: String, result: @escaping FlutterResult){
        let checkout = MercadoPagoCheckout.init(builder: MercadoPagoCheckoutBuilder.init(publicKey: publicKey, preferenceId: preferenceId))
        checkout.start(navigatorController: self.navigationController!, lifeCycleProtocol: self )
    }
    
    func finishCheckout () -> ((_ payment: PXResult?)-> void)?{
        return  ({(_, payment: PXResult?) in
            var messageString = ""
            var paymentId : String = ""
            var paymentStatus : String = ""
            var paymentStatusDetail : String = ""
            if let delegate = payment {
                message = "successful payment"
                paymentStatus = delegate.getStatus()
                paymentStatusDetail = delegate.getStatusDetail ()
                
                if _idPago = (delegate.getPaymentId()) {
                    paymentId = _idPago
                }
            }
            let channelMercadoPagoResponse = FlutterMethodChannel(name: "developergbp.com/mercadoPago/response", bynaryMessenger: self.flutterVC.binaryMessenger)
            channelMercadoPagoResponse.invokeMethod(method: "mercadoPagoOK", arguments: ["message": message, "paymentId": paymentId, "paymentStatus": paymentStatus, "paymentStatusDetail": paymentStatusDetail])
            
        })
    }
    func cancelheckout() -> (()-> void)? {
        return {
            let channelMercadoPagoResponse;.invokeMethod(method: "mercadoPagoError", arguments: ["message": "paymentCancelled", "paymentId": paymentId, "paymentStatus": paymentStatus, "paymentStatusDetail": paymentStatusDetail])
        }
    }
}

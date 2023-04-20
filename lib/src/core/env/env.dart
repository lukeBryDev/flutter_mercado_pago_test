import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  late EnvMode _mode;

  static final Env _instance = Env._internal();

  Env._internal();

  factory Env(EnvMode mode) {
    _instance._mode = mode;

    _mpPublicKeySandbox = dotenv.env['mpPublicKeySandbox'] ?? '';
    _mpAccessTokenSandbox = dotenv.env['mpAccessTokenSandbox'] ?? '';
    _mpPublicKeyProduction = dotenv.env['mpPublicKeyProduction'] ?? '';
    _mpAccessTokenProduction = dotenv.env['mpAccessTokenProduction'] ?? '';
    mpClientId = dotenv.env['mpClientId'] ?? '';
    mpClientSecret = dotenv.env['mpClientSecret'] ?? '';

    mpPaymentCardTestName = dotenv.env['mpPaymentCardTestName'] ?? '';
    mpPaymentCardTestNumber = dotenv.env['mpPaymentCardTestNumber'] ?? '';
    mpPaymentCardTestExpirationDate =
        dotenv.env['mpPaymentCardTestExpirationDate'] ?? '';
    mpPaymentCardTestExpirationSecurityCode =
        dotenv.env['mpPaymentCardTestExpirationSecurityCode'] ?? '';

    return _instance;
  }

  static String _mpPublicKeySandbox = '';
  static String _mpAccessTokenSandbox = '';

  static String _mpPublicKeyProduction = '';
  static String _mpAccessTokenProduction = '';

  static String mpClientId = '';
  static String mpClientSecret = '';

  static String mpPaymentCardTestName = '';
  static String mpPaymentCardTestNumber = '';
  static String mpPaymentCardTestExpirationDate = '';
  static String mpPaymentCardTestExpirationSecurityCode = '';

  static String get mpPublicKey {
    switch (_instance._mode) {
      case EnvMode.production:
        return _mpPublicKeyProduction;
      case EnvMode.sandbox:
        return _mpPublicKeySandbox;
    }
  }

  static String get mpAccessToken {
    switch (_instance._mode) {
      case EnvMode.production:
        return _mpAccessTokenProduction;
      case EnvMode.sandbox:
        return _mpAccessTokenSandbox;
    }
  }
}

enum EnvMode { sandbox, production }

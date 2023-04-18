import 'dart:io';

class Env {
  late EnvMode _mode;
  late EnvOptions? _options;

  static final Env _instance = Env._internal();

  Env._internal();

  factory Env(EnvMode mode, [EnvOptions? options]) {
    _instance._mode = mode;
    _instance._options = options;

    _mpPublicKeySandbox = '';
    _mpAccessTokenSandbox = '';
    _mpPublicKeyProduction = '';
    _mpAccessTokenProduction = '';
    mpClientId = '';
    mpClientSecret = '';

     return _instance;
  }

  static String _mpPublicKeySandbox = '';
  static String _mpAccessTokenSandbox = '';

  static String _mpPublicKeyProduction = '';
  static String _mpAccessTokenProduction = '';

  static String mpClientId = '';
  static String mpClientSecret = '';

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

class EnvOptions {
  final int stageNumberProduction;
  final int stageNumberSandbox;
  final int stageNumberLocal;
  final int stageNumberDiscontinued;
  final int numberReleaseCandidate;

  const EnvOptions({
    this.stageNumberProduction = 1,
    this.stageNumberSandbox = 1,
    this.stageNumberLocal = 1,
    this.stageNumberDiscontinued = 1,
    this.numberReleaseCandidate = 1,
  });
}

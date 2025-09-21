import 'package:vico/app_config.dart';

import 'core/services/network/url_config.dart';



void main() {
  AppConfig.initializeAndRunInstance(
      appName: 'Vico', enviroment: Environment.development);

  //
  // var ap = AuthRepositoryImpl(injector.get());
  //
  // ap.authenticateWithApple();
}

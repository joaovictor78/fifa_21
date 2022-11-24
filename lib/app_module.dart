import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/network/custom_dio/custom_dio.dart';
import 'core/network/utils/constants.dart';
import 'modules/players/players_module.dart';
import 'modules/splash_screen/splash_screen_module.dart';
import 'modules/start/start_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio()),
        Bind.singleton((i) => CustomDio(i<Dio>(), Settings.API_URL))
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashScreenModule()),
        ModuleRoute('/start', module: StartModule()),
        ModuleRoute('/players', module: PlayersModule()),
      ];
}

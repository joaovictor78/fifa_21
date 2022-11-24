import 'package:flutter_modular/flutter_modular.dart';
import '../best_players/best_players_module.dart';
import '../players/players_module.dart';
import '../teams/teams_module.dart';
import 'start_page.dart';

class StartModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, _) => const StartPage(),
            children: [
              ModuleRoute('/players',
                  module: PlayersModule(), transition: TransitionType.fadeIn),
              ModuleRoute('/best_players',
                  module: BestPlayersModule(),
                  transition: TransitionType.fadeIn),
              ModuleRoute('/teams',
                  module: TeamsModule(), transition: TransitionType.fadeIn),
            ],
            transition: TransitionType.fadeIn)
      ];
}

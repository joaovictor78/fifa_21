import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/best_players_page.dart';

class BestPlayersModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const BestPlayersPage()),
      ];
}

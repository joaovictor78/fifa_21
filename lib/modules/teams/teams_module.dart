import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/teams_page.dart';

class TeamsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const TeamsPage()),
      ];
}

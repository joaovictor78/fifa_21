import 'package:flutter_modular/flutter_modular.dart';
import 'start_page.dart';

class StartModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/",
            child: (context, _) => const StartPage(),
            children: [],
            transition: TransitionType.fadeIn)
      ];
}

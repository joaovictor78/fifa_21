import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design_system/styles/color_palettes.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  ValueNotifier<int> selectedPageValueNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    Modular.to.navigate('/start/players/list_players');
    Modular.to.addListener(onChangeRoute);
  }

  void onChangeRoute() {
    if (Modular.to.path.contains('players/list_players')) {
      selectedPageValueNotifier.value = 0;
    }

    if (Modular.to.path.contains('best_players')) {
      selectedPageValueNotifier.value = 1;
    }

    if (Modular.to.path.contains('teams')) {
      selectedPageValueNotifier.value = 2;
    }
  }

  @override
  void dispose() {
    Modular.to.removeListener(onChangeRoute);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: const RouterOutlet(),
          bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).primaryColor,
                primaryColor: Theme.of(context).colorScheme.secondary,
                textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(color: ColorPalettes.accentPrimary)),
              ),
              child: StatefulBuilder(
                  builder: (context, setState) => SizedBox(
                        height: 80,
                        child: BottomAppBar(
                          child: ValueListenableBuilder(
                            valueListenable: selectedPageValueNotifier,
                            builder: (context, selectedPage, child) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: TextButton(
                                    onPressed: () {
                                      Modular.to.navigate(
                                          "/start/players/list_players");
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          'assets/image-icons/player-icon.png',
                                          color: selectedPage == 0
                                              ? ColorPalettes.accentPrimary
                                              : ColorPalettes.accentPrimary
                                                  .withOpacity(0.6),
                                          height: 25,
                                          width: 25,
                                        ),
                                        Text(
                                          "Players",
                                          style: GoogleFonts.poppins(
                                              fontWeight: selectedPage == 0
                                                  ? FontWeight.w700
                                                  : FontWeight.w400,
                                              color: selectedPage == 0
                                                  ? ColorPalettes.accentPrimary
                                                  : ColorPalettes.accentPrimary
                                                      .withOpacity(0.5)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: TextButton(
                                    onPressed: () {
                                      Modular.to
                                          .navigate("/start/best_players");
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          'assets/image-icons/trophy-icon.png',
                                          color: selectedPage == 1
                                              ? ColorPalettes.accentPrimary
                                              : ColorPalettes.accentPrimary
                                                  .withOpacity(0.6),
                                          height: 25,
                                          width: 25,
                                        ),
                                        Text(
                                          "Best Players",
                                          style: GoogleFonts.rubik(
                                            fontWeight: selectedPage == 1
                                                ? FontWeight.w800
                                                : FontWeight.w400,
                                            color: selectedPage == 1
                                                ? ColorPalettes.accentPrimary
                                                : ColorPalettes.accentPrimary
                                                    .withOpacity(0.6),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: TextButton(
                                    onPressed: () {
                                      Modular.to.navigate("/start/teams");
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          'assets/image-icons/team-soccer-icon.png',
                                          color: selectedPage == 1
                                              ? ColorPalettes.accentPrimary
                                              : ColorPalettes.accentPrimary
                                                  .withOpacity(0.6),
                                          height: 25,
                                          width: 25,
                                        ),
                                        Text(
                                          "Teams",
                                          style: GoogleFonts.rubik(
                                              fontWeight: selectedPage == 2
                                                  ? FontWeight.w800
                                                  : FontWeight.w400,
                                              color: selectedPage == 2
                                                  ? ColorPalettes.accentPrimary
                                                  : ColorPalettes.accentPrimary
                                                      .withOpacity(0.6)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )))),
    );
  }
}

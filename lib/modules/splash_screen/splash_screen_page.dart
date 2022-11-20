import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../design_system/styles/color_palettes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController _soccerAnimationController;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    _soccerAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..forward().whenComplete(() => {});
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    _soccerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorPalettes.lightPrimary,
                  ColorPalettes.accentPrimary,
                ],
                begin: const FractionalOffset(0.0, 2.0),
                end: const FractionalOffset(0.6, 0.9),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sports_soccer_rounded,
                    size: 65,
                    color: Colors.white,
                  ),
                  Text(
                    "FIFA 21",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: LottieBuilder.asset(
                "assets/lottie/sport-ball.json",
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.width * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

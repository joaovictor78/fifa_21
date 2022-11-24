import 'package:fifa21/design_system/styles/color_palettes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/best_players_type_card_component.dart';

class BestPlayersPage extends StatefulWidget {
  const BestPlayersPage({super.key});

  @override
  State<BestPlayersPage> createState() => _BestPlayersPageState();
}

class _BestPlayersPageState extends State<BestPlayersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.lightPrimary,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/image-icons/trophy-icon.png',
                  height: 60,
                  width: 60,
                  color: Colors.white,
                ),
                Text(
                  'Best Players',
                  style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select best players by overall',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                  BestPlayersTypeCardComponent(
                    title: 'See the best players',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select best players by position',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                  BestPlayersTypeCardComponent(
                    title: 'See the best players',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select best players by nacionality',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                  BestPlayersTypeCardComponent(
                    title: 'See the best players',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select best players by league',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                  BestPlayersTypeCardComponent(
                    title: 'See the best players',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

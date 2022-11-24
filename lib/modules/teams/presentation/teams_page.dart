import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../design_system/styles/color_palettes.dart';
import 'components/teams_type_card_component.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPagePageState();
}

class _TeamsPagePageState extends State<TeamsPage> {
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
                  'assets/image-icons/team-soccer-icon.png',
                  height: 60,
                  width: 60,
                  color: Colors.white,
                ),
                Text(
                  'Teams',
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
                      'Assemble your Best Team',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                  TeamsTypeCardComponent(
                    title: 'See the best players',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Assemble your Best Team By League',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                  TeamsTypeCardComponent(
                    title: 'See the best players',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Assemble your Best Team By Nationality',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                  ),
                  TeamsTypeCardComponent(
                    title: 'See the best players',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

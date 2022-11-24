import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';

// ignore: must_be_immutable
class BestPlayersTypeCardComponent extends StatelessWidget {
  String title;
  // ignore: use_key_in_widget_constructors
  BestPlayersTypeCardComponent({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorPalettes.accentPrimary,
          borderRadius: BorderRadius.circular(10)),
      height: 100,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/image-icons/cursor-icon.png'),
          )
        ]),
      ),
    );
  }
}

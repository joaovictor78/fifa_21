import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';
import '../../domain/entities/player_entity.dart';

class PlayerCardComponent extends StatelessWidget {
  PlayerEntity? player;
  PlayerCardComponent({this.player});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/players/profile', arguments: {'player': player});
      },
      child: Stack(
        children: [
          player?.avatarUrl == null || player?.avatarUrl == ''
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(player?.avatarUrl ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorPalettes.black12.withOpacity(0.6)),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    ColorPalettes.accentPrimary.withOpacity(0.6),
                    ColorPalettes.accentPrimary.withOpacity(0.7),
                  ],
                  begin: AlignmentDirectional.bottomEnd,
                  end: AlignmentDirectional.topStart,
                ),
              ),
              child: Center(
                  child: Text(
                player?.shortName ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

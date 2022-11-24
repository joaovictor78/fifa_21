import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';

// ignore: must_be_immutable
class FilterPlayerCardComponent extends StatelessWidget {
  FilterPlayerCardComponent({super.key});
  List<String> titles = ["Team", "League", "Nationality", "Position"];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.4),
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorPalettes.lightPrimary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Text('Select filter type: ',
                          style: GoogleFonts.poppins(color: Colors.white)),
                    ),
                    for (String title in titles) ...[
                      TextButton(
                        onPressed: () {
                          if (title.endsWith('y')) {
                            title = title.replaceAll('y', 'ies');
                            Modular.to.pushNamed(
                              '/players/${title.toLowerCase()}',
                            );
                          } else {
                            Modular.to.pushNamed(
                              '/players/${title.toLowerCase()}s',
                            );
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorPalettes.accentPrimary),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';
import '../../domain/entities/player_entity.dart';

class PlayerProfilePage extends StatefulWidget {
  PlayerEntity? playerEntity;
  PlayerProfilePage({this.playerEntity});

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class _PlayerProfilePageState extends State<PlayerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.lightPrimary,
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 10),
                    Text(
                      "Player",
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Align(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.playerEntity?.avatarUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorPalettes.black12.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(widget.playerEntity?.longName ?? '',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.playerEntity?.overall.toString() ?? '0',
                          style: GoogleFonts.poppins(
                              color: ColorPalettes.accentPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("Overall",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Text("Age",
                            style: GoogleFonts.poppins(
                                color: ColorPalettes.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        Text("${widget.playerEntity?.age ?? ''} Yers Old",
                            style: GoogleFonts.poppins(
                                color: ColorPalettes.accentPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Club",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        Text('${widget.playerEntity?.clubName}',
                            style: GoogleFonts.poppins(
                                color: ColorPalettes.accentPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.w300)),
                        const SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Text("Nationality",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text('${widget.playerEntity?.nationality}',
                            style: GoogleFonts.poppins(
                                color: ColorPalettes.accentPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Weight",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(widget.playerEntity?.weightInKg.value ?? '',
                            style: GoogleFonts.poppins(
                                color: ColorPalettes.accentPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                        const SizedBox(
                          width: 20,
                          height: 20,
                        ),
                        Text("Height",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        Text(widget.playerEntity?.heightInMetters.value ?? '',
                            style: GoogleFonts.poppins(
                                color: ColorPalettes.accentPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Text("Skills",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(widget.playerEntity?.pace.toString() ?? '0',
                                  style: GoogleFonts.poppins(
                                      color: ColorPalettes.accentPrimary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(width: 5),
                              Text("PAC",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Text(
                                  widget.playerEntity?.dribbling.toString() ??
                                      '0',
                                  style: GoogleFonts.poppins(
                                      color: ColorPalettes.accentPrimary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(width: 5),
                              Text("DRI",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                  widget.playerEntity?.shooting.toString() ??
                                      '0',
                                  style: GoogleFonts.poppins(
                                      color: ColorPalettes.accentPrimary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(width: 5),
                              Text("SHO",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Text(
                                  widget.playerEntity?.defending.toString() ??
                                      '0',
                                  style: GoogleFonts.poppins(
                                      color: ColorPalettes.accentPrimary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(width: 5),
                              Text("DEF",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                  widget.playerEntity?.passing.toString() ??
                                      '0',
                                  style: GoogleFonts.poppins(
                                      color: ColorPalettes.accentPrimary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(width: 5),
                              Text("PAS",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Text(
                                  widget.playerEntity?.physic.toString() ?? '0',
                                  style: GoogleFonts.poppins(
                                      color: ColorPalettes.accentPrimary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                              const SizedBox(width: 5),
                              Text("PHY",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

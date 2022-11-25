import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';
import '../bloc/list_players_with_filter_bloc.dart';
import '../events/players_events.dart';
import '../states/players_states.dart';

// ignore: must_be_immutable
class ListPlayersWithFilterPage extends StatefulWidget {
  String type = "";
  int id;
  // ignore: use_key_in_widget_constructors
  ListPlayersWithFilterPage({required this.type, required this.id});

  @override
  State<ListPlayersWithFilterPage> createState() =>
      _ListPlayersWithFilterPageState();
}

class _ListPlayersWithFilterPageState extends State<ListPlayersWithFilterPage> {
  final _scrollController = ScrollController(initialScrollOffset: 5.0);
  late ListPlayersWithFilterBloc bloc;
  int _page = 1;
  @override
  void initState() {
    bloc = Modular.get<ListPlayersWithFilterBloc>();
    bloc.add(FetchAllPlayersWithFilter(id: widget.id, filterType: widget.type));
    FocusManager.instance.primaryFocus?.unfocus();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.lightPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                    'Players',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'List of Players By ${widget.type}',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
              ),
            ),
            BlocBuilder(
                bloc: bloc,
                builder: (context, ResultPlayersState state) {
                  if (state.status == PlayersStatus.initial) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorPalettes.accentPrimary,
                        ),
                      ),
                    );
                  }
                  if (bloc.state.players?.isEmpty == true) {
                    return Expanded(
                      child: Center(
                          child: Text(
                        "No player available",
                        style: GoogleFonts.poppins(color: Colors.white),
                      )),
                    );
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: bloc.state.players!.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Modular.to.pushNamed('/players/profile',
                                      arguments: {
                                        'player': bloc.state.players?[index]
                                      });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: ColorPalettes.accentPrimary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(children: [
                                        bloc.state.players?[index].avatarUrl ==
                                                ''
                                            ? Container()
                                            : CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    Colors.transparent,
                                                backgroundImage: NetworkImage(
                                                    bloc.state.players?[index]
                                                            .avatarUrl ??
                                                        ''),
                                              ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.players?[index]
                                                        .shortName ??
                                                    '',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                "Overall: #${state.players?[index].overall}",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Text(
                                                "League: ${state.players?[index].leagueName}",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    )),
                              ),
                            );
                          })),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Modular.dispose<ListPlayersWithFilterBloc>();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      bloc.add(FetchAllPlayersWithFilter(
          page: _page++, id: widget.id, filterType: widget.type));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll);
  }
}

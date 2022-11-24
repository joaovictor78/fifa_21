import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';
import '../../../../design_system/widgets/search_bar_widget.dart';
import '../bloc/players_bloc.dart';
import '../components/filter_player_card_component.dart';
import '../components/player_card_component.dart';
import '../events/players_events.dart';
import '../states/players_states.dart';

class ListPlayersPage extends StatefulWidget {
  const ListPlayersPage({super.key});

  @override
  State<ListPlayersPage> createState() => _ListPlayersPageState();
}

class _ListPlayersPageState extends State<ListPlayersPage> {
  final _scrollController = ScrollController(initialScrollOffset: 5.0);
  late PlayersBloc bloc;
  int _page = 1;
  @override
  void initState() {
    bloc = Modular.get<PlayersBloc>();
    bloc.add(FetchAllPlayers());
    FocusManager.instance.primaryFocus?.unfocus();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.lightPrimary,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Row(
                  children: [
                    Image.asset('assets/image-icons/player-icon.png'),
                    const SizedBox(width: 10),
                    Text(
                      'Players',
                      style: GoogleFonts.poppins(
                          fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SearchBarWidget(
                onChanged: (value) {
                  if (value.length > 1) {
                    _page = 1;
                    bloc.add(FetchAllPlayers(
                        page: 1, playerName: value, isActiveSearch: true));
                  } else {
                    bloc.add(FetchAllPlayers(page: 1));
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('All Players List',
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.white)),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return GestureDetector(
                                    child: FilterPlayerCardComponent());
                              });
                        },
                        child: Row(
                          children: [
                            Text('Filter',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: ColorPalettes.white)),
                            Icon(
                              Icons.filter_alt_outlined,
                              size: 20,
                              color: ColorPalettes.accentPrimary,
                            )
                          ],
                        ))
                  ],
                ),
              ),
              BlocBuilder(
                  bloc: bloc,
                  builder: (context, ResultPlayersState state) {
                    if (state.status == PlayersStatus.initial) {
                      return Center(
                        child: CircularProgressIndicator(
                            color: ColorPalettes.accentPrimary),
                      );
                    }
                    return Expanded(
                      child: Center(
                        child: GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 140,
                                    mainAxisExtent: 150,
                                    childAspectRatio: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 20),
                            itemCount: bloc.state.players?.length == null
                                ? 0
                                : bloc.state.players!.length - 1,
                            itemBuilder: (context, index) {
                              return PlayerCardComponent(
                                player: bloc.state.players?[index],
                              );
                            }),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      bloc.add(FetchAllPlayers(page: _page++));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll);
  }
}

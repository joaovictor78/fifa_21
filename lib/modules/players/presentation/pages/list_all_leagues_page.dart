import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';
import '../../../../design_system/widgets/search_bar_widget.dart';
import '../bloc/leagues_bloc.dart';
import '../events/filter_type_events.dart';
import '../states/filter_type_items_states.dart';

// ignore: must_be_immutable
class ListAllLeaguesPage extends StatefulWidget {
  const ListAllLeaguesPage({super.key});

  @override
  State<ListAllLeaguesPage> createState() => _ListAllLeaguesPageState();
}

class _ListAllLeaguesPageState extends State<ListAllLeaguesPage> {
  late LeaguesBloc bloc;
  final _scrollController = ScrollController(initialScrollOffset: 5.0);
  int _page = 0;

  @override
  void initState() {
    bloc = Modular.get<LeaguesBloc>();
    bloc.add(FetchFilterTypesItems());
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
                    'Leagues',
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
                'Filter By Leagues',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
              ),
            ),
            SearchBarWidget(
                hintText: "Search for a team...", onChanged: (value) {}),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: BlocBuilder(
                    bloc: bloc,
                    builder: (context, ResultFilterTypeItemsByLeague state) {
                      if (state.status == FilterTypeItemsStatus.initial) {
                        return CircularProgressIndicator(
                          color: ColorPalettes.accentPrimary,
                        );
                      }
                      return ListView.builder(
                          itemCount: bloc.state.leagues?.length == null
                              ? 0
                              : bloc.state.leagues!.length - 1,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                onTap: () {
                                  Modular.to.pushNamed(
                                      '/players/list_players/leagues',
                                      arguments: {
                                        'id': state.leagues?[index].id ?? 0
                                      });
                                },
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    state.leagues?[index].name ?? '',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                ),
                                tileColor: ColorPalettes.accentPrimary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            );
                          }));
                    }),
              ),
            ))
          ],
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
      bloc.add(FetchFilterTypesItems(page: _page++));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll);
  }
}

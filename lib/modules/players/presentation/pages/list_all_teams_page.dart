import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../design_system/styles/color_palettes.dart';
import '../../../../design_system/widgets/search_bar_widget.dart';
import '../bloc/teams_bloc.dart';
import '../events/filter_type_events.dart';
import '../states/filter_type_items_states.dart';

// ignore: must_be_immutable
class ListAllTeamsPage extends StatefulWidget {
  const ListAllTeamsPage({super.key});

  @override
  State<ListAllTeamsPage> createState() => _ListAllTeamsPageState();
}

class _ListAllTeamsPageState extends State<ListAllTeamsPage> {
  late TeamsBloc bloc;
  final _scrollController = ScrollController(initialScrollOffset: 5.0);
  int _page = 0;

  @override
  void initState() {
    bloc = Modular.get<TeamsBloc>();
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
                    'Teams',
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
                'Filter By Teams',
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
                    builder: (context, ResultFilterTypeItemsByTeam state) {
                      if (state.status == FilterTypeItemsStatus.initial) {
                        return CircularProgressIndicator(
                          color: ColorPalettes.accentPrimary,
                        );
                      }
                      if (state.status == FilterTypeItemsStatus.initial) {
                        return Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorPalettes.accentPrimary,
                            ),
                          ),
                        );
                      }
                      if (bloc.state.teams?.isEmpty == true) {
                        return Expanded(
                          child: Center(
                              child: Text(
                            "No player available",
                            style: GoogleFonts.poppins(color: Colors.white),
                          )),
                        );
                      }
                      return ListView.builder(
                          itemCount: bloc.state.teams?.length == null
                              ? 0
                              : bloc.state.teams!.length - 1,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                onTap: () {
                                  Modular.to.pushNamed(
                                      '/players/list_players/teams',
                                      arguments: {
                                        'id': state.teams?[index].id ?? 0
                                      });
                                },
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    state.teams?[index].name ?? '',
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
    Modular.dispose<TeamsBloc>();
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

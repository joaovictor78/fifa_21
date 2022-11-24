import 'package:flutter_modular/flutter_modular.dart';
import 'infra/repositories/leagues_repository_impl.dart';
import 'infra/repositories/nationalities_repository_impl.dart';
import 'infra/repositories/players_repository_impl.dart';
import 'infra/repositories/positions_repository_impl.dart';
import 'infra/repositories/teams_repository_impl.dart';
import 'presentation/bloc/leagues_bloc.dart';
import 'presentation/bloc/list_players_with_filter_bloc.dart';
import 'presentation/bloc/nationalities_bloc.dart';
import 'presentation/bloc/players_bloc.dart';
import 'presentation/bloc/positions_bloc.dart';
import 'presentation/bloc/teams_bloc.dart';
import 'presentation/pages/list_all_leagues_page.dart';
import 'presentation/pages/list_all_nationalities_page.dart';
import 'presentation/pages/list_all_positions_page.dart';
import 'presentation/pages/list_all_teams_page.dart';
import 'presentation/pages/list_players_page.dart';
import 'presentation/pages/list_players_with_filter_page.dart';
import 'presentation/pages/player_profile_page.dart';

class PlayersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => PlayersRepositoryImpl(i())),
        Bind.lazySingleton((i) => PlayersBloc(i.get<PlayersRepositoryImpl>())),
        Bind.lazySingleton((i) => LeagueRepositoryImpl(i())),
        Bind.lazySingleton((i) => TeamsRepositoryImpl(i())),
        Bind.lazySingleton((i) => TeamsBloc(teamsRepository: i())),
        Bind.lazySingleton((i) => PositionsRepositoryImpl(i())),
        Bind.lazySingleton((i) => PositionsBloc(positionsRepository: i())),
        Bind.lazySingleton((i) => NationalitiesRepositoryImpl(i())),
        Bind.lazySingleton(
            (i) => NationalitiesBloc(nationalitiesRepository: i())),
        Bind.lazySingleton((i) =>
            LeaguesBloc(leaguesRepository: i.get<LeagueRepositoryImpl>())),
        Bind.lazySingleton((i) => ListPlayersWithFilterBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/list_players',
            child: (context, args) => const ListPlayersPage()),
        ChildRoute('/leagues',
            child: (context, args) => const ListAllLeaguesPage()),
        ChildRoute('/teams',
            child: (context, args) => const ListAllTeamsPage()),
        ChildRoute('/nationalities',
            child: (context, args) => const ListAllNationalitiesPage()),
        ChildRoute('/positions',
            child: (context, args) => const ListAllPositionsPage()),
        ChildRoute('/list_players/:type',
            child: (context, args) => ListPlayersWithFilterPage(
                type: args.params['type'], id: args.data['id'])),
        ChildRoute('/profile',
            child: (context, args) => PlayerProfilePage(
                  playerEntity: args.data['player'],
                )),
      ];
}

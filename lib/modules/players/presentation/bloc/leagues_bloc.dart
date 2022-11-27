import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/contracts/league_repository.dart';
import '../events/filter_type_events.dart';
import '../states/filter_type_items_states.dart';

class LeaguesBloc
    extends Bloc<ListFilterTypeEvent, ResultFilterTypeItemsByLeague> {
  final ILeaguesRepository leaguesRepository;
  LeaguesBloc({
    required this.leaguesRepository,
  }) : super(ResultFilterTypeItemsByLeague(
            status: FilterTypeItemsStatus.initial)) {
    on<FetchFilterTypesItems>(_fetchAllLeagues);
  }

  Future<void> _fetchAllLeagues(
      FetchFilterTypesItems event, Emitter emit) async {
    if (state.hasReachedMax) return;
    if (state.status == FilterTypeItemsStatus.initial) {
      final leaguesOrFailure = await (event.isSearch && event.name.isNotEmpty
          ? leaguesRepository.findAllLeaguesByName(
              leagueName: event.name, page: 1)
          : leaguesRepository.findAllLeagues(page: event.page));
      leaguesOrFailure.fold(
          (l) => emit(state.copyWith(status: FilterTypeItemsStatus.failure)),
          (r) => emit(ResultFilterTypeItemsByLeague(
              status: FilterTypeItemsStatus.success,
              hasReachedMax: false,
              leagues: List.of(state.leagues ?? [])..addAll(r))));
      return;
    }
    final leaguesOrFailure = await (event.isSearch && event.name.isNotEmpty
        ? leaguesRepository.findAllLeaguesByName(
            leagueName: event.name, page: 1)
        : leaguesRepository.findAllLeagues(page: event.page));

    leaguesOrFailure.fold(
        (l) => emit(ResultFilterTypeItemsByLeague(
            status: FilterTypeItemsStatus.failure)),
        (r) => !event.isSearch && r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: FilterTypeItemsStatus.success,
                leagues: event.isSearch
                    ? (List.of([])..addAll(r))
                    : List.of(state.leagues ?? [])
                  ..addAll(r),
                hasReachedMax: false,
              )));
  }
}

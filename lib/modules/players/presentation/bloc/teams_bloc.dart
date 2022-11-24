import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/contracts/team_repository.dart';
import '../events/filter_type_events.dart';
import '../states/filter_type_items_states.dart';

class TeamsBloc extends Bloc<ListFilterTypeEvent, ResultFilterTypeItemsByTeam> {
  final ITeamsRepository teamsRepository;
  TeamsBloc({
    required this.teamsRepository,
  }) : super(ResultFilterTypeItemsByTeam(
            status: FilterTypeItemsStatus.initial)) {
    on<FetchFilterTypesItems>(_fetchAllTeams);
  }

  Future<void> _fetchAllTeams(FetchFilterTypesItems event, Emitter emit) async {
    if (state.hasReachedMax) return;
    if (state.status == FilterTypeItemsStatus.initial) {
      final teamsOrFailure =
          await teamsRepository.findAllTeams(page: event.page);
      teamsOrFailure.fold(
          (l) => emit(state.copyWith(status: FilterTypeItemsStatus.failure)),
          (r) => emit(ResultFilterTypeItemsByTeam(
              status: FilterTypeItemsStatus.success,
              hasReachedMax: false,
              teams: List.of(state.teams ?? [])..addAll(r))));
    }
    final teamsOrFailure = await teamsRepository.findAllTeams(page: event.page);

    teamsOrFailure.fold(
        (l) => emit(ResultFilterTypeItemsByLeague(
            status: FilterTypeItemsStatus.failure)),
        (r) => r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: FilterTypeItemsStatus.success,
                teams: List.of(state.teams ?? [])..addAll(r),
                hasReachedMax: false,
              )));
  }
}

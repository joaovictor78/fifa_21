import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/contracts/players_repository.dart';
import '../events/players_events.dart';
import '../states/players_states.dart';

class PlayersBloc extends Bloc<ListPlayersEvent, ResultPlayersState> {
  final IPlayersRepository _repository;
  PlayersBloc(this._repository)
      : super(ResultPlayersState(status: PlayersStatus.initial)) {
    on<FetchAllPlayers>(_fetchPlayers);
  }

  Future<void> _fetchPlayers(FetchAllPlayers event, Emitter emit) async {
    if (state.hasReachedMax) return;
    if (state.status == PlayersStatus.initial) {
      final playersOrFailure = await (event.isSearch
          ? _repository.findAllPlayersByName(
              playerName: event.playerName, page: 1)
          : _repository.findAllPlayers(page: event.page));
      playersOrFailure.fold(
          (l) => emit(state.copyWith(status: PlayersStatus.failure)),
          (r) => emit(ResultPlayersState(
              status: PlayersStatus.success,
              hasReachedMax: false,
              players: List.of(state.players ?? [])..addAll(r))));
    }

    final playersOrFailure =
        await (event.isSearch && event.playerName.isNotEmpty
            ? _repository.findAllPlayersByName(
                playerName: event.playerName, page: 1)
            : _repository.findAllPlayers(page: event.page));

    playersOrFailure.fold(
        (l) => emit(ResultPlayersState(status: PlayersStatus.failure)),
        (r) => !event.isSearch && r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: PlayersStatus.success,
                players: event.isSearch
                    ? (List.of([])..addAll(r))
                    : List.of(state.players ?? [])
                  ..addAll(r),
                hasReachedMax: false,
              )));
  }
}

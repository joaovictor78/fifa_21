import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/general_failures.dart';
import '../../domain/contracts/players_repository.dart';
import '../../domain/entities/player_entity.dart';
import '../events/players_events.dart';
import '../states/players_states.dart';

class ListPlayersWithFilterBloc
    extends Bloc<ListPlayersEvent, ResultPlayersState> {
  final IPlayersRepository _repository;
  ListPlayersWithFilterBloc(this._repository)
      : super(ResultPlayersState(status: PlayersStatus.initial)) {
    on<FetchAllPlayersWithFilter>(_fetchPlayersWithFilter);
  }

  Future<void> _fetchPlayersWithFilter(
      FetchAllPlayersWithFilter event, Emitter emit) async {
    if (state.status == PlayersStatus.initial) {
      final productsOrFailure = await _getPlayersWithFilter(
          page: event.page, id: event.id, filter: event.filterType);
      productsOrFailure.fold(
          (l) => emit(state.copyWith(status: PlayersStatus.failure)),
          (r) => emit(ResultPlayersState(
              status: PlayersStatus.success,
              hasReachedMax: false,
              players: List.of(state.players ?? [])..addAll(r))));
    }

    final productsOrFailure = await _getPlayersWithFilter(
        page: event.page, id: event.id, filter: event.filterType);

    productsOrFailure.fold(
        (l) => emit(ResultPlayersState(status: PlayersStatus.failure)),
        (r) => r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: PlayersStatus.success,
                players: List.of(state.players ?? [])..addAll(r),
                hasReachedMax: false,
              )));
  }

  Future<Either<Failure, List<PlayerEntity>>> _getPlayersWithFilter(
      {required FilterType filter, required int id, required int page}) async {
    if (filter == FilterType.league) {
      return await _repository.findAllPlayersByLeague(page: page, leagueId: id);
    } else if (filter == FilterType.team) {
      return await _repository.findAllPlayersByTeam(page: page, teamId: id);
    } else if (filter == FilterType.nationality) {
      return await _repository.findAllPlayersByNationality(
          page: page, nationalityId: id);
    } else {
      return await _repository.findAllPlayersByPosition(
          page: page, positionId: id);
    }
  }
}

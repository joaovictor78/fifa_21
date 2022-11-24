import '../../domain/entities/player_entity.dart';

enum PlayersStatus { initial, success, failure }

class ResultPlayersState {
  final List<PlayerEntity>? players;
  final bool hasReachedMax;
  final PlayersStatus? status;

  ResultPlayersState({this.players, this.hasReachedMax = false, this.status});
  ResultPlayersState copyWith({
    PlayersStatus? status,
    List<PlayerEntity>? players,
    bool? hasReachedMax,
  }) {
    return ResultPlayersState(
      status: status ?? this.status,
      players: players ?? this.players,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

import '../../domain/entities/league_entity.dart';
import '../../domain/entities/nationality_entity.dart';
import '../../domain/entities/position_entity.dart';
import '../../domain/entities/team_entity.dart';

enum FilterTypeItemsStatus { initial, success, failure }

class ResultFilterItemsTypeByNationality {
  final List<NationalityEntity>? nationalities;
  final FilterTypeItemsStatus status;
  final bool hasReachedMax;

  ResultFilterItemsTypeByNationality(
      {this.nationalities,
      this.status = FilterTypeItemsStatus.initial,
      this.hasReachedMax = false});
  ResultFilterItemsTypeByNationality copyWith({
    FilterTypeItemsStatus? status,
    bool? hasReachedMax,
    List<NationalityEntity>? nationalities,
  }) {
    return ResultFilterItemsTypeByNationality(
        nationalities: nationalities ?? this.nationalities,
        status: status ?? this.status,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class ResultFilterItemsTypeByPosition {
  final List<PositionEntity>? positions;
  final FilterTypeItemsStatus status;
  final bool hasReachedMax;

  ResultFilterItemsTypeByPosition(
      {this.positions,
      this.status = FilterTypeItemsStatus.initial,
      this.hasReachedMax = false});
  ResultFilterItemsTypeByPosition copyWith({
    FilterTypeItemsStatus? status,
    List<PositionEntity>? positions,
    bool? hasReachedMax,
  }) {
    return ResultFilterItemsTypeByPosition(
        positions: positions ?? this.positions,
        status: status ?? this.status,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class ResultFilterTypeItemsByTeam {
  final List<TeamEntity>? teams;
  final FilterTypeItemsStatus status;
  final bool hasReachedMax;

  ResultFilterTypeItemsByTeam(
      {this.teams,
      this.status = FilterTypeItemsStatus.initial,
      this.hasReachedMax = false});
  ResultFilterTypeItemsByTeam copyWith({
    FilterTypeItemsStatus? status,
    List<TeamEntity>? teams,
    bool? hasReachedMax,
  }) {
    return ResultFilterTypeItemsByTeam(
        teams: teams ?? this.teams,
        status: status ?? this.status,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class ResultFilterTypeItemsByLeague {
  final List<LeagueEntity>? leagues;
  final FilterTypeItemsStatus status;
  final bool hasReachedMax;

  ResultFilterTypeItemsByLeague(
      {this.leagues,
      this.status = FilterTypeItemsStatus.initial,
      this.hasReachedMax = false});
  ResultFilterTypeItemsByLeague copyWith({
    FilterTypeItemsStatus? status,
    List<LeagueEntity>? leagues,
    bool? hasReachedMax,
  }) {
    return ResultFilterTypeItemsByLeague(
        leagues: leagues ?? this.leagues,
        status: status ?? this.status,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

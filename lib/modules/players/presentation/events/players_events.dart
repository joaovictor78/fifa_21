abstract class ListPlayersEvent {}

enum FilterType { league, team, position, nationality }

class FetchAllPlayers implements ListPlayersEvent {
  final int page;
  final String playerName;
  final bool isActiveSearch;

  FetchAllPlayers(
      {this.page = 1, this.playerName = "", this.isActiveSearch = false});
}

class FetchAllPlayersWithFilter implements ListPlayersEvent {
  final int page;
  final int id;
  FilterType filterType = FilterType.league;

  FetchAllPlayersWithFilter(
      {this.page = 1, this.id = 0, String filterType = ""}) {
    if (filterType == 'leagues') {
      this.filterType = FilterType.league;
    } else if (filterType == 'teams') {
      this.filterType == FilterType.team;
    } else if (filterType == 'nationalities') {
      this.filterType == FilterType.nationality;
    } else if (filterType == 'positions') {
      this.filterType = FilterType.position;
    }
  }
}

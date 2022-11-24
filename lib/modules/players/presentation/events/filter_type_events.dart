abstract class ListFilterTypeEvent {}

enum FilterType { league, team, position, nationality }

class FetchFilterTypesItems implements ListFilterTypeEvent {
  final int page;
  final String name;
  FilterType? filterType;
  FetchFilterTypesItems(
      {this.page = 1, this.name = "", this.filterType = FilterType.league});
}

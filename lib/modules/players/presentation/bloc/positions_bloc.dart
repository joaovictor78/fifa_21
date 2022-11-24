import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/contracts/position_repository.dart';
import '../events/filter_type_events.dart';
import '../states/filter_type_items_states.dart';

class PositionsBloc
    extends Bloc<ListFilterTypeEvent, ResultFilterItemsTypeByPosition> {
  final IPositionsRepository positionsRepository;
  PositionsBloc({
    required this.positionsRepository,
  }) : super(ResultFilterItemsTypeByPosition(
            status: FilterTypeItemsStatus.initial)) {
    on<FetchFilterTypesItems>(_fetchAllPositions);
  }

  Future<void> _fetchAllPositions(
      FetchFilterTypesItems event, Emitter emit) async {
    if (state.hasReachedMax) return;
    if (state.status == FilterTypeItemsStatus.initial) {
      final positionsOrFailure =
          await positionsRepository.findAllPositions(page: event.page);
      positionsOrFailure.fold(
          (l) => emit(state.copyWith(status: FilterTypeItemsStatus.failure)),
          (r) => emit(ResultFilterItemsTypeByPosition(
              status: FilterTypeItemsStatus.success,
              hasReachedMax: false,
              positions: List.of(state.positions ?? [])..addAll(r))));
    }
    final positionsOrFailure =
        await positionsRepository.findAllPositions(page: event.page);

    positionsOrFailure.fold(
        (l) => emit(ResultFilterTypeItemsByLeague(
            status: FilterTypeItemsStatus.failure)),
        (r) => r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: FilterTypeItemsStatus.success,
                positions: List.of(state.positions ?? [])..addAll(r),
                hasReachedMax: false,
              )));
  }
}

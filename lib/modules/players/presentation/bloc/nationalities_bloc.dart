import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/contracts/nationality_repository.dart';
import '../events/filter_type_events.dart';
import '../states/filter_type_items_states.dart';

class NationalitiesBloc
    extends Bloc<ListFilterTypeEvent, ResultFilterItemsTypeByNationality> {
  final INationalitiesRepository nationalitiesRepository;
  NationalitiesBloc({
    required this.nationalitiesRepository,
  }) : super(ResultFilterItemsTypeByNationality(
            status: FilterTypeItemsStatus.initial)) {
    on<FetchFilterTypesItems>(_fetchAllNationalities);
  }

  Future<void> _fetchAllNationalities(
      FetchFilterTypesItems event, Emitter emit) async {
    if (state.hasReachedMax) return;
    if (state.status == FilterTypeItemsStatus.initial) {
      final nationalitiesOrFailure =
          await nationalitiesRepository.findAllNationalities(page: event.page);
      nationalitiesOrFailure.fold(
          (l) => emit(state.copyWith(status: FilterTypeItemsStatus.failure)),
          (r) => emit(ResultFilterItemsTypeByNationality(
              status: FilterTypeItemsStatus.success,
              hasReachedMax: false,
              nationalities: List.of(state.nationalities ?? [])..addAll(r))));
    }
    final nationalitiesOrFailure =
        await nationalitiesRepository.findAllNationalities(page: event.page);

    nationalitiesOrFailure.fold(
        (l) => emit(ResultFilterItemsTypeByNationality(
            status: FilterTypeItemsStatus.failure)),
        (r) => r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
                status: FilterTypeItemsStatus.success,
                nationalities: List.of(state.nationalities ?? [])..addAll(r),
                hasReachedMax: false,
              )));
  }
}

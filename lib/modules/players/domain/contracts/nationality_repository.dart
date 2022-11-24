import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../entities/nationality_entity.dart';

abstract class INationalitiesRepository {
  Future<Either<Failure, List<NationalityEntity>>> findAllNationalities(
      {int page = 1});
  Future<Either<Failure, List<NationalityEntity>>> findAllNationalitiesByName(
      {int page = 1, required String nationalityName});
}

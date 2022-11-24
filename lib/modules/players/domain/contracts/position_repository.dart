import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../entities/position_entity.dart';

abstract class IPositionsRepository {
  Future<Either<Failure, List<PositionEntity>>> findAllPositions(
      {int page = 1});
  Future<Either<Failure, List<PositionEntity>>> findAllPositionsByName(
      {int page = 1, required String positionName});
}

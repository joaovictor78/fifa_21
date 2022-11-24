import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../entities/team_entity.dart';

abstract class ITeamsRepository {
  Future<Either<Failure, List<TeamEntity>>> findAllTeams({int page = 1});
  Future<Either<Failure, List<TeamEntity>>> findAllTeamsByName(
      {int page = 1, required String teamName});
}

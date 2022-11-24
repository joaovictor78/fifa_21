import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../entities/league_entity.dart';

abstract class ILeaguesRepository {
  Future<Either<Failure, List<LeagueEntity>>> findAllLeagues({int page = 1});
  Future<Either<Failure, List<LeagueEntity>>> findAllLeaguesByName(
      {int page = 1, required String leagueName});
}

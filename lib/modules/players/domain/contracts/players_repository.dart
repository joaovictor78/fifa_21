import 'package:dartz/dartz.dart';
import '../../../../core/errors/general_failures.dart';
import '../entities/player_entity.dart';

abstract class IPlayersRepository {
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayers({int page = 0});
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByName(
      {int page = 0, required String playerName});
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByTeam(
      {int page = 0, required int teamId});
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByLeague(
      {int page = 0, required int leagueId});
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByNationality(
      {int page = 0, required int nationalityId});
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByPosition(
      {int page = 0, required int positionId});
}

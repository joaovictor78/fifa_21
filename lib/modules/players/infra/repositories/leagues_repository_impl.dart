import 'package:dartz/dartz.dart';
import '../../../../core/errors/client_http_failures.dart';
import '../../../../core/errors/general_failures.dart';
import '../../../../core/network/contracts/i_http_client.dart';
import '../../domain/contracts/league_repository.dart';
import '../../domain/entities/league_entity.dart';
import '../dtos/league_dto.dart';

class LeagueRepositoryImpl implements ILeaguesRepository {
  final IHttpClient _client;
  LeagueRepositoryImpl(this._client);

  @override
  Future<Either<Failure, List<LeagueEntity>>> findAllLeagues(
      {int page = 1}) async {
    try {
      final reponse =
          await _client.get('/leagues', queryParameters: {'page': page});
      final leagues = (reponse.data['value']['leagues'] as List)
          .map((value) => LeagueDTO.fromMap(value))
          .toList();
      return right(leagues);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<LeagueEntity>>> findAllLeaguesByName(
      {int page = 1, required String leagueName}) async {
    try {
      final reponse = await _client.get('/leagues-by-name',
          queryParameters: {'page': page, 'league_name': leagueName});
      final leagues = (reponse.data['value']['leagues'] as List)
          .map((value) => LeagueDTO.fromMap(value))
          .toList();
      return right(leagues);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }
}

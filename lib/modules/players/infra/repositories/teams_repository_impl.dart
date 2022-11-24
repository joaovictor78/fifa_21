import 'package:dartz/dartz.dart';
import '../../../../core/errors/client_http_failures.dart';
import '../../../../core/errors/general_failures.dart';
import '../../../../core/network/contracts/i_http_client.dart';
import '../../domain/contracts/team_repository.dart';
import '../../domain/entities/team_entity.dart';
import '../dtos/team_dto.dart';

class TeamsRepositoryImpl implements ITeamsRepository {
  final IHttpClient _client;
  TeamsRepositoryImpl(this._client);

  @override
  Future<Either<Failure, List<TeamEntity>>> findAllTeams({int page = 1}) async {
    try {
      final reponse =
          await _client.get('/teams', queryParameters: {'page': page});
      final teams = (reponse.data['value']['teams'] as List)
          .map((value) => TeamDTO.fromMap(value))
          .toList();
      return right(teams);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<TeamEntity>>> findAllTeamsByName(
      {int page = 1, required String teamName}) async {
    try {
      final reponse = await _client.get('/teams-by-name',
          queryParameters: {'page': page, 'team_name': teamName});
      final teams = (reponse.data['value']['teams'] as List)
          .map((value) => TeamDTO.fromMap(value))
          .toList();
      return right(teams);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }
}

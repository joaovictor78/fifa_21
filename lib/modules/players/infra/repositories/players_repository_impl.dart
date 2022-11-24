import 'package:dartz/dartz.dart';
import 'package:fifa21/core/errors/client_http_failures.dart';
import 'package:fifa21/modules/players/infra/dtos/player_dto.dart';
import '../../../../core/errors/general_failures.dart';
import '../../../../core/network/contracts/i_http_client.dart';
import '../../domain/contracts/players_repository.dart';
import '../../domain/entities/player_entity.dart';

class PlayersRepositoryImpl implements IPlayersRepository {
  final IHttpClient _client;

  PlayersRepositoryImpl(this._client);
  @override
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayers(
      {int page = 1}) async {
    try {
      final reponse =
          await _client.get('/players', queryParameters: {'page': page});
      final players = (reponse.data['value']['players'] as List)
          .map((value) => PlayerDTO.fromMap(value))
          .toList();
      return right(players);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByName(
      {int page = 1, required String playerName}) async {
    try {
      final reponse = await _client.get('/players-by-name', queryParameters: {
        'page': page,
        'player_name': playerName,
        'limit': 30
      });
      final players = (reponse.data['value']['players'] as List)
          .map((value) => PlayerDTO.fromMap(value))
          .toList();
      return right(players);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByLeague(
      {int page = 1, required int leagueId}) async {
    try {
      final reponse = await _client.get('/players-by-league',
          queryParameters: {'page': page, 'league_id': leagueId});
      final players = (reponse.data['value']['players'] as List)
          .map((value) => PlayerDTO.fromMap(value))
          .toList();
      return right(players);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByNationality(
      {int page = 0, required int nationalityId}) async {
    try {
      final reponse = await _client.get('/players-by-nationality',
          queryParameters: {'page': page, 'nationality_id': nationalityId});
      final players = (reponse.data['value']['players'] as List)
          .map((value) => PlayerDTO.fromMap(value))
          .toList();
      return right(players);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByPosition(
      {int page = 0, required int positionId}) async {
    try {
      final reponse = await _client.get('/players-by-position',
          queryParameters: {'page': page, 'position_id': positionId});
      final players = (reponse.data['value']['players'] as List)
          .map((value) => PlayerDTO.fromMap(value))
          .toList();
      return right(players);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<PlayerEntity>>> findAllPlayersByTeam(
      {int page = 0, required int teamId}) async {
    try {
      final reponse = await _client.get('/players-by-team',
          queryParameters: {'page': page, 'team_id': teamId});
      final players = (reponse.data['value']['players'] as List)
          .map((value) => PlayerDTO.fromMap(value))
          .toList();
      return right(players);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }
}

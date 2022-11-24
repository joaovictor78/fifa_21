import 'package:dartz/dartz.dart';
import '../../../../core/errors/client_http_failures.dart';
import '../../../../core/errors/general_failures.dart';
import '../../../../core/network/contracts/i_http_client.dart';
import '../../domain/contracts/position_repository.dart';
import '../../domain/entities/position_entity.dart';
import '../dtos/position_dto.dart';

class PositionsRepositoryImpl implements IPositionsRepository {
  final IHttpClient _client;
  PositionsRepositoryImpl(this._client);

  @override
  Future<Either<Failure, List<PositionEntity>>> findAllPositions(
      {int page = 1}) async {
    try {
      final reponse =
          await _client.get('/positions', queryParameters: {'page': page});
      final nationalities = (reponse.data['value']['positions'] as List)
          .map((value) => PositionDTO.fromMap(value))
          .toList();
      return right(nationalities);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<PositionEntity>>> findAllPositionsByName(
      {int page = 1, required String positionName}) async {
    try {
      final reponse = await _client.get('/positions-by-name',
          queryParameters: {'page': page, 'position_name': positionName});
      final positions = (reponse.data['value']['leagues'] as List)
          .map((value) => PositionDTO.fromMap(value))
          .toList();
      return right(positions);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }
}

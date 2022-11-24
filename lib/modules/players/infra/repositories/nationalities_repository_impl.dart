import 'package:dartz/dartz.dart';
import '../../../../core/errors/client_http_failures.dart';
import '../../../../core/errors/general_failures.dart';
import '../../../../core/network/contracts/i_http_client.dart';
import '../../domain/contracts/nationality_repository.dart';
import '../../domain/entities/nationality_entity.dart';
import '../dtos/nationality_dto.dart';

class NationalitiesRepositoryImpl implements INationalitiesRepository {
  final IHttpClient _client;
  NationalitiesRepositoryImpl(this._client);

  @override
  Future<Either<Failure, List<NationalityEntity>>> findAllNationalities(
      {int page = 1}) async {
    try {
      final reponse =
          await _client.get('/nationalities', queryParameters: {'page': page});
      final nationalities = (reponse.data['value']['nationalities'] as List)
          .map((value) => NationalityDTO.fromMap(value))
          .toList();
      return right(nationalities);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }

  @override
  Future<Either<Failure, List<NationalityEntity>>> findAllNationalitiesByName(
      {int page = 1, required String nationalityName}) async {
    try {
      final reponse = await _client.get('/nationalities-by-name',
          queryParameters: {'page': page, 'nationality_name': nationalityName});
      final leagues = (reponse.data['value']['leagues'] as List)
          .map((value) => NationalityDTO.fromMap(value))
          .toList();
      return right(leagues);
    } on HttpClientFailures catch (error) {
      return left(HttpClientFailures(error));
    }
  }
}

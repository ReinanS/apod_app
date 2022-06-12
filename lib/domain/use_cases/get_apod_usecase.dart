import 'package:apod_app/data/failure.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/domain/repositories/get_apod_repository.dart';
import 'package:dartz/dartz.dart';

class GetApodUseCase {
  final GetApodRepository _getApodRepository;

  GetApodUseCase(this._getApodRepository);

  Future<Either<Failure, ApodEntity>> execute(String url) {
    return _getApodRepository.getApodRepository(url);
  }
}

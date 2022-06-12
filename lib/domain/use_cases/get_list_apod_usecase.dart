import 'package:apod_app/data/failure.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/domain/repositories/get_list_apod_repository.dart';
import 'package:dartz/dartz.dart';

class GetListApodUseCase {
  final GetListApodRepository _getListApodRepository;

  GetListApodUseCase(this._getListApodRepository);

  Future<Either<Failure, List<ApodEntity>>> execute(String url) {
    return _getListApodRepository.getListApodRepository(url);
  }
}

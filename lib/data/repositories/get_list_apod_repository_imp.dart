import 'package:apod_app/data/datasources/get_list_apod_datasource.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/data/failure.dart';
import 'package:apod_app/domain/repositories/get_list_apod_repository.dart';
import 'package:dartz/dartz.dart';

class GetListApodRepositoryImpl implements GetListApodRepository {
  final GetListApodDatasource _getListApodDatasource;
  const GetListApodRepositoryImpl(this._getListApodDatasource);

  @override
  Future<Either<Failure, List<ApodEntity>>> getListApodRepository(
      String date) async {
    return await _getListApodDatasource.getListApodRepository(date);
  }
}

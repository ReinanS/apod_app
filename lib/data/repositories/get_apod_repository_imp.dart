import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/data/failure.dart';
import 'package:apod_app/domain/repositories/get_apod_repository.dart';
import 'package:dartz/dartz.dart';

class GetApodRepositoryImpl implements GetApodRepository {
  final GetApodDatasource _getApodDatasource;
  const GetApodRepositoryImpl(this._getApodDatasource);

  @override
  Future<Either<Failure, ApodEntity>> getApodRepository(String date) async {
    return await _getApodDatasource.getApodRepository(date);
  }
}

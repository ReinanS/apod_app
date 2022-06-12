import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/data/failure.dart';

class GetApodDataSourceDecorator implements GetApodDatasource {
  final GetApodDatasource _getApodDatasource;
  const GetApodDataSourceDecorator(this._getApodDatasource);

  @override
  Future<Either<Failure, ApodEntity>> getApodRepository(String date) =>
      _getApodDatasource.getApodRepository(date);
}

import 'package:apod_app/data/datasources/get_list_apod_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/data/failure.dart';

class GetListApodDataSourceDecorator implements GetListApodDatasource {
  final GetListApodDatasource _getListApodDatasource;
  const GetListApodDataSourceDecorator(this._getListApodDatasource);

  @override
  Future<Either<Failure, List<ApodEntity>>> getListApodRepository(
          String date) =>
      _getListApodDatasource.getListApodRepository(date);
}

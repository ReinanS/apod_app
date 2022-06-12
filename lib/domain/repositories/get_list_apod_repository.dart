import 'package:apod_app/data/failure.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetListApodRepository {
  Future<Either<Failure, List<ApodEntity>>> getListApodRepository(String date);
}

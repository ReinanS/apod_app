import 'dart:convert';
import 'dart:io';

import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/data/datasources/get_list_apod_datasource.dart';
import 'package:apod_app/data/exception.dart';
import 'package:apod_app/data/models/apod_model.dart';
import 'package:dartz/dartz.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/data/failure.dart';
import 'package:http/http.dart' as http;

class GetListApodRemoteDataSourceImp implements GetListApodDatasource {
  final http.Client client;
  const GetListApodRemoteDataSourceImp({required this.client});

  @override
  Future<Either<Failure, List<ApodEntity>>> getListApodRepository(
      String date) async {
    try {
      final response = await client.get(Uri.parse(date));
      Iterable list = json.decode(response.body);
      List<ApodModel> listModel =
          list.map((e) => ApodModel.fromMap(e)).toList();

      List<ApodEntity> listEntity =
          listModel.map((model) => model.toEntity()).toList();

      return Right(listEntity);
    } on ServerException {
      return const Left(ServerFailure('Server failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

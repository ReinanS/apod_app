import 'dart:convert';
import 'dart:io';

import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/data/exception.dart';
import 'package:apod_app/data/models/apod_model.dart';
import 'package:dartz/dartz.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/data/failure.dart';
import 'package:http/http.dart' as http;

class GetApodRemoteDataSourceImp implements GetApodDatasource {
  final http.Client client;
  const GetApodRemoteDataSourceImp({required this.client});

  @override
  Future<Either<Failure, ApodEntity>> getApodRepository(String date) async {
    try {
      final response = await client.get(Uri.parse(date));
      ApodModel apodModel = ApodModel.fromJson(response.body);

      return Right(apodModel.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}

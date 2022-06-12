import 'dart:convert';
import 'dart:developer';

import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/data/datasources/local/get_apod_datasource_decorator.dart';
import 'package:apod_app/data/failure.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetApodDataSourceDecoratorImpl extends GetApodDataSourceDecorator {
  GetApodDataSourceDecoratorImpl(GetApodDatasource getApodDatasource)
      : super(getApodDatasource);

  @override
  Future<Either<Failure, ApodEntity>> getApodRepository(String date) async {
    return (await super.getApodRepository(date)).fold(
      (error) async => Right(await _getInCache()),
      (sucess) {
        _saveInCache(sucess);
        return Right(sucess);
      },
    );
  }

  void _saveInCache(ApodEntity apodEntity) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonApod = json.encode(apodEntity.toJson());
    prefs.setString('apod_cache', jsonApod);

    log('Saved in cache');
  }

  Future<ApodEntity> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var apodJsonString = prefs.getString('apod_cache');

    if (apodJsonString == null) {
      throw Exception();
    }

    var jsonApod = json.decode(apodJsonString);
    var apod = ApodEntity.fromJson(jsonApod);

    log('Recovered apod: ' + apod.toString());

    return apod;
  }
}

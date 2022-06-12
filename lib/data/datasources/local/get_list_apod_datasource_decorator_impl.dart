import 'dart:convert';
import 'dart:developer';
import 'dart:html';

import 'package:apod_app/data/datasources/get_list_apod_datasource.dart';
import 'package:apod_app/data/datasources/local/get_list_apod_datasource_decorator.dart';
import 'package:apod_app/data/failure.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetListApodDataSourceDecoratorImpl
    extends GetListApodDataSourceDecorator {
  GetListApodDataSourceDecoratorImpl(
      GetListApodDatasource getListApodDatasource)
      : super(getListApodDatasource);

  @override
  Future<Either<Failure, List<ApodEntity>>> getListApodRepository(
      String date) async {
    return (await super.getListApodRepository(date)).fold(
      (error) async => Right(await _getInCache()),
      (sucess) {
        _saveInCache(sucess);
        return Right(sucess);
      },
    );
  }

  void _saveInCache(List<ApodEntity> listApodEntity) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonApods =
        json.encode(listApodEntity.map((a) => a.toJson()).toList());
    prefs.setString('list_apod_cache', jsonApods);

    log('Saved in cache');
  }

  Future<List<ApodEntity>> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var apodJsonString = prefs.getString('apod_cache');

    if (apodJsonString == null) {
      throw Exception();
    }

    var jsonApod = json.decode(apodJsonString) as List;

    List<ApodEntity> listApods =
        jsonApod.map((a) => ApodEntity.fromMap(a)).toList();

    log('Recovered apod: ');
    return listApods;
  }
}

import 'dart:developer';

import 'package:apod_app/core/utils/apis_utils.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/domain/use_cases/get_apod_usecase.dart';
import 'package:flutter/widgets.dart';

class ApodController {
  final GetApodUseCase _getApodUseCase;

  final int _apodQtd = 10;

  ApodController(this._getApodUseCase) {
    fetchApod();
  }

  ValueNotifier<ApodEntity?> apod = ValueNotifier<ApodEntity?>(null);
  ApodEntity? _cachedApod;

  void fetchApod() async {
    var result = await _getApodUseCase.execute(API.REQUEST_APOD());

    result.fold(
      (error) => debugPrint(error.toString()),
      (sucess) => apod.value = sucess,
    );

    _cachedApod = apod.value;
  }

  void fetchRandomApods(int count) async {}

  void fetchDateRangedApods(String startDate, String endDate) async {}
}

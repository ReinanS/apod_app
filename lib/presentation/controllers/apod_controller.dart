import 'dart:developer';

import 'package:apod_app/core/utils/api.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/domain/use_cases/get_list_apod_usecase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApodController {
  final GetListApodUseCase _getListApodUseCase;

  final int _apodQtd = 10;

  ApodController(this._getListApodUseCase) {
    initializer();
  }

  Future<void> initializer() async {
    _dateMessage = 'Select a date';
    await _fetchRandomApods();
  }

  late ValueNotifier<String> dateMessageNotifier = ValueNotifier<String>('');

  ValueNotifier<bool> loadingNotifier = ValueNotifier<bool>(true);

  ValueNotifier<List<ApodEntity>?> listApodNotifier =
      ValueNotifier<List<ApodEntity>?>(null);

  ValueNotifier<DateTimeRange?> dateTimeNotifier =
      ValueNotifier<DateTimeRange?>(null);

  set _dateMessage(String message) => dateMessageNotifier.value = message;

  set _loading(bool load) => loadingNotifier.value = load;

  set _listApod(List<ApodEntity> list) => listApodNotifier.value = list;

  set _dateTime(DateTimeRange? dateTimeRange) =>
      dateTimeNotifier.value = dateTimeRange;

  String get dateMessage => dateMessageNotifier.value;
  bool get loading => loadingNotifier.value;
  List<ApodEntity>? get listApod => listApodNotifier.value;
  DateTimeRange? get dateTimeRange => dateTimeNotifier.value;

  Future<void> _fetchRandomApods() async {
    _loading = true;

    var result = await _getListApodUseCase
        .execute(API.REQUEST_APOD_RANDOM_LIST(_apodQtd));

    result.fold(
      (error) => debugPrint(error.toString()),
      (sucess) => _listApod = sucess,
    );

    _loading = false;
  }

  Future<void> fetchSelectDate(BuildContext context) async {
    await pickDateRange(context);
    _fetchDateRangedApods(getFrom(), getUtil());
  }

  void _fetchDateRangedApods(String startDate, String endDate) async {
    log('$startDate : $endDate');

    _loading = true;
    var result = await _getListApodUseCase
        .execute(API.REQUEST_APOD_DATE_RANGED_LIST(startDate, endDate));

    result.fold(
      (error) => debugPrint(error.toString()),
      (sucess) => _listApod = sucess,
    );

    _loading = false;
  }

  Future<void> pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 15),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateTimeRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    _dateTime = newDateRange;
    _dateMessage = '${getFrom()} | ${getUtil()}';
  }

  String getFrom() => dateTimeRange == null
      ? ' - '
      : DateFormat('yyyy-MM-dd').format(dateTimeRange!.start);

  String getUtil() => dateTimeRange == null
      ? 'Select a date'
      : DateFormat('yyyy-MM-dd').format(dateTimeRange!.end);
}

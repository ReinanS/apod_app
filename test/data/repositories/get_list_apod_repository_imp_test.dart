import 'dart:io';

import 'package:apod_app/core/utils/api.dart';
import 'package:apod_app/data/exception.dart';
import 'package:apod_app/data/failure.dart';
import 'package:apod_app/data/repositories/get_list_apod_repository_imp.dart';
import 'package:apod_app/domain/repositories/get_list_apod_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/fixtures.dart';
import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late MockGetListApodDatasource mockGetListApodDatasource;
  late GetListApodRepository repository;

  setUp(() {
    mockGetListApodDatasource = MockGetListApodDatasource();
    repository = GetListApodRepositoryImpl(mockGetListApodDatasource);
  });

  test(
      'should return Astronomy Picture of the Day list when a call to data source is sucessful',
      () async {
    when(mockGetListApodDatasource.getListApodRepository(API.REQUEST_APOD()))
        .thenAnswer((_) async => const Right(tListApodEntity));

    final result = await repository.getListApodRepository(API.REQUEST_APOD());

    verify(mockGetListApodDatasource.getListApodRepository(API.REQUEST_APOD()));
    expect(result, equals(const Right(tListApodEntity)));
  });
}

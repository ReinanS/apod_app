import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/data/repositories/get_apod_repository_imp.dart';
import 'package:apod_app/domain/repositories/get_apod_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/fixtures.dart';
import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late MockGetApodDatasource mockGetApodDatasource;
  late GetApodRepository repository;

  setUp(() {
    mockGetApodDatasource = MockGetApodDatasource();
    repository = GetApodRepositoryImpl(mockGetApodDatasource);
  });

  test('get Astronomy Picture of the Day ', () async {
    const tDate = '';

    when(mockGetApodDatasource.getApodRepository(tDate))
        .thenAnswer((_) async => const Right(tApodEntity));

    final result = await repository.getApodRepository(tDate);

    expect(result, equals(const Right(tApodEntity)));
  });
}

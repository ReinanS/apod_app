import 'package:apod_app/core/utils/api.dart';
import 'package:apod_app/domain/repositories/get_list_apod_repository.dart';
import 'package:apod_app/domain/use_cases/get_list_apod_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/fixtures.dart';
import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late GetListApodRepository mockGetListApodRepository;
  late GetListApodUseCase getApodUseCase;

  setUp(() {
    mockGetListApodRepository = MockGetListApodRepository();
    getApodUseCase = GetListApodUseCase(mockGetListApodRepository);
  });

  test('should get list apod information from repository', () async {
    when(mockGetListApodRepository.getListApodRepository(API.REQUEST_APOD()))
        .thenAnswer((_) async => const Right(tListApodEntity));

    final result = await getApodUseCase.execute(API.REQUEST_APOD());

    expect(result, equals(const Right(tListApodEntity)));
  });
}

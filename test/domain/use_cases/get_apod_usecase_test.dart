import 'package:apod_app/domain/repositories/get_apod_repository.dart';
import 'package:apod_app/domain/use_cases/get_apod_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mocks/fixtures.dart';
import '../../helpers/mocks/test_helper.mocks.dart';

void main() {
  late GetApodRepository mockGetApodRepository;
  late GetApodUseCase getApodUseCase;

  setUp(() {
    mockGetApodRepository = MockGetApodRepository();
    getApodUseCase = GetApodUseCase(mockGetApodRepository);
  });

  const tPhoto = 'dasdasda';

  test('should get apod information from repository', () async {
    when(mockGetApodRepository.getApodRepository(tPhoto))
        .thenAnswer((_) async => const Right(tApodEntity));

    final result = await getApodUseCase.execute(tPhoto);

    expect(result, equals(const Right(tApodEntity)));
  });
}

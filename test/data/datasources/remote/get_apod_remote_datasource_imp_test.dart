import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/data/datasources/remote/get_apod_remote_datasource_imp.dart';
import 'package:apod_app/data/exception.dart';
import 'package:apod_app/data/failure.dart';
import 'package:apod_app/data/models/apod_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/mocks/fixtures.dart';
import '../../../helpers/mocks/test_helper.mocks.dart';

import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late GetApodDatasource dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = GetApodRemoteDataSourceImp(client: mockHttpClient);
  });

  group('get Astronomy Picture of the Day ', () {
    const tDate = '06/11/22';
    final tApodModel = ApodModel.fromJson(
        readJson('helpers/dummy_data/dummy_apod_response.json'));

    test(
        'should return Astronomy Picture of the Day when a call to data source is successful',
        () async {
      when(mockHttpClient.get(Uri.parse(''))).thenAnswer((_) async =>
          http.Response(
              readJson('helpers/dummy_data/dummy_apod_response.json'), 200));

      final result = await dataSource.getApodRepository(tDate);

      expect(result, equals(Right(tApodModel.toEntity())));
    });

    // test(
    //     'should throw a server exception when the response code is 404 or other',
    //     () async {
    //   // arrange
    //   when(
    //     mockHttpClient.get(Uri.parse('')),
    //   ).thenAnswer(
    //     (_) async => http.Response('Not found', 404),
    //   );

    //   // act
    //   final result = dataSource.getApodRepository(tDate);

    //   // assert
    //   expect(result, equals(const Left(ServerFailure('Server failure'))));
    // });
  });
}

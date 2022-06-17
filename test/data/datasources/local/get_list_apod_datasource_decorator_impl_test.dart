import 'package:apod_app/core/utils/api.dart';
import 'package:apod_app/data/datasources/local/get_list_apod_datasource_decorator_impl.dart';
import 'package:apod_app/data/datasources/remote/get_list_apod_remote_datasource_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/mocks/fixtures.dart';
import '../../../helpers/mocks/test_helper.mocks.dart';

import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late GetListApodDataSourceDecoratorImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = GetListApodDataSourceDecoratorImpl(
        GetListApodRemoteDataSourceImp(client: mockHttpClient));
  });

  group('get list of Astronomy Picture of the Day: ', () {
    test(
        'should return Astronomy Picture of the Day when a call to data source is successful',
        () async {
      when(mockHttpClient.get(Uri.parse(API.REQUEST_APOD_RANDOM_LIST(10))))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_list_apod_response.json'),
              200));

      final result = await dataSource
          .getListApodRepository(API.REQUEST_APOD_RANDOM_LIST(10));

      late final dynamic response;

      result.fold((e) => response = e, (s) => response = s);

      expect(result.isRight(), true);
      expect(response, equals(tListApodEntity));
    });

    test('should save in Cache', () async {
      dataSource.saveInCache(tListApodEntity);

      final result = await dataSource.getInCache();

      expect(result, tListApodEntity);
    });
  });
}

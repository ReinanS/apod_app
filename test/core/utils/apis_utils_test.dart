import 'package:apod_app/core/utils/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Teste API Utils', () {
    test('Get APOD Random List', () {
      const tApodUrl =
          'https://api.nasa.gov/planetary/apod?api_key=l5tKTlIg2Rif0TPEyOCKiUpi3gGiKLb8dmsg10Xl&count=10';

      final result = API.REQUEST_APOD_RANDOM_LIST(10);

      expect(tApodUrl, equals(result));
    });

    test('Get APOD Date Ranged List', () {
      const tApodUrl =
          'https://api.nasa.gov/planetary/apod?api_key=l5tKTlIg2Rif0TPEyOCKiUpi3gGiKLb8dmsg10Xl&start_date=2021-06-12&end_date=2022-06-12';

      final result =
          API.REQUEST_APOD_DATE_RANGED_LIST('2021-06-12', '2022-06-12');

      expect(tApodUrl, equals(result));
    });
  });
}

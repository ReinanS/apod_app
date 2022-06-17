class API {
  static const String _baseUrl = 'https://api.nasa.gov/planetary/apod';

  static const String _apiKey = 'l5tKTlIg2Rif0TPEyOCKiUpi3gGiKLb8dmsg10Xl';

  static String REQUEST_APOD() => '$_baseUrl?api_key=$_apiKey';

  static String REQUEST_APOD_RANDOM_LIST(int count) =>
      '$_baseUrl?api_key=$_apiKey&count=$count';

  static String REQUEST_APOD_DATE_RANGED_LIST(
          String startDate, String endDate) =>
      '$_baseUrl?api_key=$_apiKey&start_date=$startDate&end_date=$endDate';
}

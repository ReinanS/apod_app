import 'dart:convert';

import 'package:apod_app/data/models/apod_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/mocks/fixtures.dart';

void main() {
  group('to Entity', () {
    test('Should be a subclass of List APOD Entity', () {
      final result = tListApodModel.map((model) => model.toEntity()).toList();

      expect(result, equals(tListApodEntity));
    });
  });

  group('from json', () {
    test('Should return a valid model from json', () {
      final jsonMap =
          readJson('helpers/dummy_data/dummy_list_apod_response.json');

      final list = json.decode(jsonMap);
      final result = list.map((e) => ApodModel.fromMap(e)).toList();

      expect(result, equals(tListApodModel));
    });
  });

  group('to json', () {
    test('Should return a valid json from model', () {});
  });
}

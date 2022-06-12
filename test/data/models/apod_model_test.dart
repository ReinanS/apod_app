import 'dart:convert';

import 'package:apod_app/data/models/apod_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/mocks/fixtures.dart';

void main() {
  group('to entity', () {
    test('Should be a subclass of APOD Entity', () {
      final result = tApodModel.toEntity();
      expect(result, equals(tApodEntity));
    });
  });

  group('from json', () {
    test('Should return a valid model from json', () {
      final jsonMap = readJson('helpers/dummy_data/dummy_apod_response.json');

      final result = ApodModel.fromJson(jsonMap);

      expect(result, equals(tApodModel));
    });
  });

  group('to json', () {
    test('', () {
      final jsonModel = tApodModel.toJson();

      final result = ApodModel.fromJson(jsonModel);

      expect(result.toJson(), equals(jsonModel));
    });
  });
}

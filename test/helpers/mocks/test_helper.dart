import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/domain/repositories/get_apod_repository.dart';
import 'package:apod_app/domain/use_cases/get_apod_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  GetApodRepository,
  GetApodDatasource,
  GetApodUseCase,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}

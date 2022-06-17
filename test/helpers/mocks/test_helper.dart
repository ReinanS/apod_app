import 'package:apod_app/data/datasources/get_list_apod_datasource.dart';
import 'package:apod_app/domain/repositories/get_list_apod_repository.dart';
import 'package:apod_app/domain/use_cases/get_list_apod_usecase.dart';
import 'package:apod_app/presentation/controllers/apod_controller.dart';
import 'package:apod_app/presentation/controllers/apod_details_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  GetListApodRepository,
  GetListApodDatasource,
  GetListApodUseCase,
  ApodController,
  ApodDetailsController,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}

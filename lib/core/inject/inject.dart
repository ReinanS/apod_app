import 'package:apod_app/data/datasources/get_apod_datasource.dart';
import 'package:apod_app/data/datasources/local/get_apod_datasource_decorator_impl.dart';
import 'package:apod_app/data/datasources/remote/get_apod_remote_datasource_imp.dart';
import 'package:apod_app/data/repositories/get_apod_repository_imp.dart';
import 'package:apod_app/domain/repositories/get_apod_repository.dart';
import 'package:apod_app/domain/use_cases/get_apod_usecase.dart';
import 'package:apod_app/presentation/controllers/apod_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // external
    getIt.registerLazySingleton(() => http.Client());

    // datasources
    getIt.registerLazySingleton<GetApodDatasource>(
      () => GetApodDataSourceDecoratorImpl(
        GetApodRemoteDataSourceImp(client: getIt()),
      ),
    );

    // repositories
    getIt.registerLazySingleton<GetApodRepository>(
      () => GetApodRepositoryImpl(getIt()),
    );

    // usecases
    getIt.registerLazySingleton<GetApodUseCase>(
      () => GetApodUseCase(getIt()),
    );

    // controllers
    getIt.registerLazySingleton<ApodController>(
      () => ApodController(getIt()),
    );
  }
}

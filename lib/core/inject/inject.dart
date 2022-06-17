import 'package:apod_app/data/datasources/get_list_apod_datasource.dart';
import 'package:apod_app/data/datasources/local/get_list_apod_datasource_decorator_impl.dart';
import 'package:apod_app/data/datasources/remote/get_list_apod_remote_datasource_imp.dart';
import 'package:apod_app/data/repositories/get_list_apod_repository_imp.dart';
import 'package:apod_app/domain/repositories/get_list_apod_repository.dart';
import 'package:apod_app/domain/use_cases/get_list_apod_usecase.dart';
import 'package:apod_app/presentation/controllers/apod_controller.dart';
import 'package:apod_app/presentation/controllers/apod_details_controller.dart';
import 'package:apod_app/presentation/ui/pages/home_page.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    // external
    getIt.registerLazySingleton(() => http.Client());

    // datasources
    getIt.registerLazySingleton<GetListApodDatasource>(
      () => GetListApodDataSourceDecoratorImpl(
        GetListApodRemoteDataSourceImp(client: getIt()),
      ),
    );

    // repositories
    getIt.registerLazySingleton<GetListApodRepository>(
      () => GetListApodRepositoryImpl(getIt()),
    );

    // usecases
    getIt.registerLazySingleton<GetListApodUseCase>(
      () => GetListApodUseCase(getIt()),
    );

    // controllers
    getIt.registerLazySingleton<ApodController>(
      () => ApodController(getIt()),
    );

    getIt.registerLazySingleton<ApodDetailsController>(
      () => ApodDetailsController(),
    );

    // pages
    getIt.registerLazySingleton<HomePage>(
        () => HomePage(apodController: getIt()));
  }
}

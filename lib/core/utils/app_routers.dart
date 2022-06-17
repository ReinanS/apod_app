import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/presentation/controllers/apod_controller.dart';
import 'package:apod_app/presentation/controllers/apod_details_controller.dart';
import 'package:apod_app/presentation/ui/pages/apod_details_page.dart';
import 'package:apod_app/presentation/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

const String homeRoute = '/home';
const String apodDetailsRoute = '/apod/details';

class AppRouters {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments; // getting args

    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            apodController: GetIt.I.get<ApodController>(),
          ),
        );

      case apodDetailsRoute:
        if (args is ApodDetailsArgs) {
          return MaterialPageRoute(
            builder: (_) => ApodDetailsPage(
              apodEntity: args.apodEntity,
              apodDetailsController: GetIt.I.get<ApodDetailsController>(),
            ),
          );
        }
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            apodController: GetIt.I.get<ApodController>(),
          ),
        );
    }
  }
}

class ApodDetailsArgs {
  final ApodEntity apodEntity;
  const ApodDetailsArgs({required this.apodEntity});
}

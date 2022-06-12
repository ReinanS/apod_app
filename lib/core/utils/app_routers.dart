import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/presentation/ui/pages/apod_details_page.dart';
import 'package:apod_app/presentation/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/home';
const String apodDetailsRoute = '/apod/details';

class AppRouters {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments; // getting args

    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case apodDetailsRoute:
        if (args is ApodDetailsArgs) {
          return MaterialPageRoute(
              builder: (_) => ApodDetailsPage(apodEntity: args.apodEntity));
        }
        break;

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}

class ApodDetailsArgs {
  final ApodEntity apodEntity;
  const ApodDetailsArgs({required this.apodEntity});
}

import 'package:apod_app/core/inject/inject.dart';
import 'package:apod_app/core/utils/app_routers.dart';
import 'package:apod_app/presentation/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'APOD APP',
      debugShowCheckedModeBanner: false,
      initialRoute: homeRoute,
      onGenerateRoute: AppRouters.generateRoute,
    );
  }
}

import 'package:apod_app/core/inject/inject.dart';
import 'package:apod_app/core/utils/app_routers.dart';
import 'package:flutter/material.dart';

void main() {
  _initializer();
  runApp(const MyApp());
}

void _initializer() {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.initialize();
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

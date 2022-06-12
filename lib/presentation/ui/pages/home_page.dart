import 'dart:developer';

import 'package:apod_app/core/utils/app_colors.dart';
import 'package:apod_app/core/utils/app_routers.dart';
import 'package:apod_app/core/utils/app_text_styles.dart';
import 'package:apod_app/core/utils/utils.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/presentation/controllers/apod_controller.dart';
import 'package:apod_app/presentation/ui/widgets/rounded_background_component.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ApodController _controller;
  late Size _deviceSize;
  late String dateMessage;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<ApodController>();
    dateMessage = 'Select a date';
  }

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: RoundedBackgroundComponent(
          height: _deviceSize.height * 0.03,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      log('select date');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(dateMessage),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(Icons.date_range),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ValueListenableBuilder<ApodEntity?>(
                    valueListenable: _controller.apod,
                    builder: (__, apod, _) {
                      if (apod == null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ApodCardWidget(
                        image: apod.hdurl,
                        title: apod.title,
                        date: apod.date,
                        onTap: () => Navigator.pushNamed(
                            context, apodDetailsRoute,
                            arguments: ApodDetailsArgs(apodEntity: apod)),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ApodCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String date;

  final void Function() onTap;

  const ApodCardWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(image),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: AppTextStyles.textFieldHeading,
                  ),
                  const SizedBox(height: 10),
                  Text(Utils.formatDate(date)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// pt_BR
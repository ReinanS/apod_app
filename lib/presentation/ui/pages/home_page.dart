import 'package:apod_app/core/utils/app_colors.dart';
import 'package:apod_app/core/utils/app_routers.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/presentation/controllers/apod_controller.dart';
import 'package:apod_app/presentation/ui/widgets/apod_card_widget.dart';
import 'package:apod_app/presentation/ui/widgets/rounded_background_widget.dart';
import 'package:apod_app/presentation/ui/widgets/select_date_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final ApodController apodController;

  const HomePage({
    Key? key,
    required this.apodController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size _deviceSize;

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: RefreshIndicator(
          onRefresh: widget.apodController.initializer,
          child: RoundedBackgroundWidget(
            height: _deviceSize.height * 0.03,
            child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: _deviceSize.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: _deviceSize.height * 0.05),
                    ValueListenableBuilder<String>(
                      valueListenable:
                          widget.apodController.dateMessageNotifier,
                      builder: (context, dateMessage, _) {
                        return SelectDateWidget(
                          dateMessage: dateMessage,
                          onTap: () async {
                            await widget.apodController
                                .fetchSelectDate(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    ValueListenableBuilder<bool>(
                      valueListenable: widget.apodController.loadingNotifier,
                      builder: (__, apod, _) {
                        List<ApodEntity>? listApod =
                            widget.apodController.listApod;

                        if (widget.apodController.loading || listApod == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView.builder(
                          itemCount: listApod.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 25),
                              child: ApodCardWidget(
                                image: listApod[index].url,
                                title: listApod[index].title,
                                date: listApod[index].date,
                                onTap: () => Navigator.pushNamed(
                                    context, apodDetailsRoute,
                                    arguments: ApodDetailsArgs(
                                        apodEntity: listApod[index])),
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:apod_app/core/utils/app_colors.dart';
import 'package:apod_app/core/utils/app_text_styles.dart';
import 'package:apod_app/core/utils/utils.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/presentation/controllers/apod_details_controller.dart';
import 'package:apod_app/presentation/ui/widgets/custom_image_network_widget.dart';
import 'package:apod_app/presentation/ui/widgets/rounded_background_widget.dart';
import 'package:flutter/material.dart';

class ApodDetailsPage extends StatefulWidget {
  final ApodEntity apodEntity;
  final ApodDetailsController apodDetailsController;

  const ApodDetailsPage({
    Key? key,
    required this.apodEntity,
    required this.apodDetailsController,
  }) : super(key: key);

  @override
  State<ApodDetailsPage> createState() => _ApodDetailsPageState();
}

class _ApodDetailsPageState extends State<ApodDetailsPage> {
  late Size _deviceSize;

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: RoundedBackgroundWidget(
          height: _deviceSize.height * 0.03,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageNetworkWidget(image: widget.apodEntity.hdurl),
                  Column(
                    children: [
                      Text(
                        '${widget.apodEntity.title} - ${Utils.formatDate(widget.apodEntity.date)}',
                        style: AppTextStyles.textdHeading,
                      ),
                      Text(
                        'Copyright: ${widget.apodEntity.copyright}',
                        style: AppTextStyles.textFieldHintStyle,
                      ),
                      Text(widget.apodEntity.explanation),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widget.apodDetailsController
                .downloadImage(widget.apodEntity.hdurl, context);
          },
          child: const Icon(Icons.download),
        ),
      ),
    );
  }
}

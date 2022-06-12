import 'package:apod_app/core/utils/app_colors.dart';
import 'package:apod_app/core/utils/app_text_styles.dart';
import 'package:apod_app/core/utils/utils.dart';
import 'package:apod_app/domain/entities/apod_entity.dart';
import 'package:apod_app/presentation/ui/widgets/rounded_background_component.dart';
import 'package:flutter/material.dart';

class ApodDetailsPage extends StatelessWidget {
  final ApodEntity apodEntity;
  late Size _deviceSize;

  ApodDetailsPage({
    Key? key,
    required this.apodEntity,
  }) : super(key: key);

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(apodEntity.hdurl),
                  Column(
                    children: [
                      Text(
                        '${apodEntity.title} - ${Utils.formatDate(apodEntity.date)}',
                        style: AppTextStyles.textdHeading,
                      ),
                      Text(
                        'Copyright: ${apodEntity.copyright}',
                        style: AppTextStyles.textFieldHintStyle,
                      ),
                      Text(apodEntity.explanation),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

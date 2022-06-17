import 'package:apod_app/core/utils/app_text_styles.dart';
import 'package:apod_app/core/utils/utils.dart';
import 'package:apod_app/presentation/ui/widgets/custom_image_network_widget.dart';
import 'package:flutter/material.dart';

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
            CustomImageNetworkWidget(image: image),
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

import 'package:apod_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SelectDateWidget extends StatelessWidget {
  final String dateMessage;
  final void Function() onTap;

  const SelectDateWidget({
    Key? key,
    required this.dateMessage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
    );
  }
}
